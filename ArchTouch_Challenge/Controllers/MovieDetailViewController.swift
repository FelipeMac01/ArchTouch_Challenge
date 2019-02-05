//
//  MovieDetailViewController.swift
//  ArchTouch_Challenge
//
//  Created by Pedro Machado on 04/02/19.
//  Copyright © 2019 Felipe Mac. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class MovieDetailViewController: UIViewController {

    var movieID = Int()
    
    @IBOutlet weak var movie_poster: UIImageView!
    @IBOutlet weak var movie_nameLbl: UILabel!
    @IBOutlet weak var release_dateLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var genresLbl: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    
    var movie : MovieDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.getMovieDetail(movieID: self.movieID)
        }
    }
    
    //MARK: Functions
    
    func setNavigationTitle() {
        let navView = UIView()
        let label = UILabel()
        label.text = "Movie Detail"
        label.font = UIFont(name: "Pacifico-Regular", size: 20)
        label.textColor = UIColor.white
        label.sizeToFit()
        label.center = navView.center
        label.textAlignment = NSTextAlignment.center
        navView.addSubview(label)
        self.navigationItem.titleView = navView
        navView.sizeToFit()
    }
    
    func configureLayout() {
        
        setNavigationTitle()
        
        self.movie_poster.image = nil
        self.movie_poster.kf.indicatorType = .activity
        self.movie_poster.kf.indicator?.startAnimatingView()
        self.movie_poster.layer.borderWidth = 1
        self.movie_poster.layer.borderColor = UIColor.white.cgColor
        
        if let imageUrl = movie?.poster_path {
            if let url = URL(string: "http://image.tmdb.org/t/p/original\(imageUrl)") {
                DispatchQueue.main.async {
                    self.movie_poster.kf.setImage(with: url)
                    self.movie_poster.kf.indicator?.stopAnimatingView()
                }
            }
        }else{
            self.movie_poster.image = #imageLiteral(resourceName: "Tmdb")
            self.movie_poster.kf.indicator?.stopAnimatingView()
        }
        
        if let movie_name = movie?.original_title {
            movie_nameLbl.text = movie_name
        }
        
        if let release_date = movie?.release_date {
            release_dateLbl.attributedText = Utilities.addTwoColorsInLabel(string1: "Release date: ", sizeColorA: 20, sizeColorB: 18, string2: release_date)
        }else{
            release_dateLbl.attributedText = Utilities.addTwoColorsInLabel(string1: "Release date: ", sizeColorA: 20, sizeColorB: 18, string2: "Unavailable")
        }
        
        if let over_view = movie?.overview {
            overviewTextView.text = over_view
        }else{
            overviewTextView.text = "Unavailable"
        }
        
        if let duration = movie?.runtime {
            durationLbl.attributedText = Utilities.addTwoColorsInLabel(string1: "Duration: ", sizeColorA: 20, sizeColorB: 18, string2: "\(duration) Min.")
        }else{
            durationLbl.attributedText = Utilities.addTwoColorsInLabel(string1: "Duration: ", sizeColorA: 20, sizeColorB: 18, string2: "Unavailable")
        }
        
        if let genres = movie?.genres {
            
            var genresTypes = " "
            var myMutableString = NSMutableAttributedString()

            let genre_count = genres.count
            var count = 0
            
            for item in genres {
                count += 1
                if let name = item.name {
                    if count != genre_count {
                        genresTypes.append("\(name), ")
                    }else{
                        genresTypes.append("\(name)")
                    }
                }
            }
            genresLbl.text = genresTypes
            let length = genresLbl.text?.count
            myMutableString = NSMutableAttributedString(string: "Genres: \(genresTypes)", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20)])
            myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSRange(location:7,length:length! + 1))
            genresLbl.attributedText = myMutableString
        }else{
            genresLbl.attributedText = Utilities.addTwoColorsInLabel(string1: "Genres: ", sizeColorA: 20, sizeColorB: 18, string2: "Unavailable")
        }
    }
    
    //MARK: Api's Call
    
    func getMovieDetail(movieID:Int) {
        
        Utilities.setLoadingScreen(view: self.view)
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 10
        
        let url = "https://api.themoviedb.org/3/movie/\(movieID)?api_key=\(Utilities.tmdb_key)&language=en-US"
        
        manager.request("\(url)", method: .get, parameters: nil).responseJSON { response in
            switch (response.result) {
            case .success:
                if let jsonDict = response.result.value as? [String:AnyObject] {
                    let object = MovieDetail(dictionary: jsonDict)
                    self.movie = object
                }
            case .failure(let error):
                
                if let errorMessage = response.response?.statusCode {
                    Utilities.createSimpleAlert(view: self, title: "The Movie DB", message: ErrorTreatment.jsonErrorTreatment(error: errorMessage))
                }
                if error.localizedDescription == "The Internet connection appears to be offline." {
                   Utilities.createSimpleAlert(view: self, title: "The Movie DB", message: "The Internet connection appears to be offline, please check your connection and try again.")
                }else{
                    Utilities.createSimpleAlert(view: self, title: "The Movie DB", message: "Something went wrong, please try again later.")
                }
                break
            }
            self.configureLayout()
            Utilities.removeLoadingScreen(view: self.view)
        }
    }
}



