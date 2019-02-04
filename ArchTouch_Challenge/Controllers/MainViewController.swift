//
//  MainViewController.swift
//  ArchTouch_Challenge
//
//  Created by Felipe Mac on 03/02/19.
//  Copyright © 2019 Felipe Mac. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBox: UISearchBar!
    @IBOutlet weak var searchBoxHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    var moviesArray = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDisplay()
        setDelegates()
        DispatchQueue.main.async {
            self.getMovies()
        }
    }
    
    func setDelegates() {
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        searchBox.delegate = self
    }
    
    func configureDisplay() {
        setNavigationTitleWithImage()
        searchBoxHeightConstraint.constant = 0
    }
    
    func setNavigationTitleWithImage() {
        let navView = UIView()
        let label = UILabel()
        label.text = "The Movie Data Base"
        label.font = UIFont(name: "Pacifico-Regular", size: 20)
        label.textColor = UIColor.white
        label.sizeToFit()
        label.center = navView.center
        label.textAlignment = NSTextAlignment.center
        
        let image = UIImageView()
        image.image = (#imageLiteral(resourceName: "theMovieDbLogo"))
        let imageAspect = image.image!.size.width/image.image!.size.height
        image.frame = CGRect(x: label.frame.origin.x-label.frame.size.height*imageAspect - 5, y: label.frame.origin.y, width: label.frame.size.height*imageAspect, height: label.frame.size.height)
        image.contentMode = UIView.ContentMode.scaleAspectFit
        
        navView.addSubview(label)
        navView.addSubview(image)
        
        self.navigationItem.titleView = navView
        
        navView.sizeToFit()
    }
    
    func activateSearchBox() {
        searchBox.text = ""
    
        UIView.animate(withDuration: 0.1,
                       delay: 0.1,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: { () -> Void in
                        self.searchBoxHeightConstraint.constant = 56
                        self.view.layoutIfNeeded()
        }, completion: { (finished) -> Void in
        })
    }
    
    func desactivateSearchBox() {
        
        UIView.animate(withDuration: 0.1,
                       delay: 0.1,
                       options: UIView.AnimationOptions.curveEaseIn,
                       animations: { () -> Void in
                        self.searchBoxHeightConstraint.constant = 0
                        self.view.layoutIfNeeded()
        }, completion: { (finished) -> Void in
        })
    }
    
    @IBAction func checkSearchBoxState(_ sender: UIBarButtonItem) {
        if searchBoxHeightConstraint.constant == 0 {
            activateSearchBox()
        }else{
            desactivateSearchBox()
        }
    }
    
    //MARK: -CollectionView Delegates
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCollectionCell {
            
            let objects = Movie(dictionary: moviesArray[indexPath.row])
            cell.object = objects
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "MovieDetailVC") as? MovieDetailViewController {
            //vc.selectedCardToPresent = selectedCard
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //MARK: -Api Call
    
    func getMovies() {
        
        Utilities.setLoadingScreen(view: self.view)

        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 30
    
        let url = "https://api.themoviedb.org/3/movie/upcoming?api_key=1f54bd990f1cdfb230adb312546d765d&language=en-US&page=1"
        
        manager.request("\(url)", method: .get, parameters: nil).responseJSON { response in
            switch (response.result) {
            case .success:
                if let jsonDict = response.result.value as? [String:AnyObject] {
                    if let data = jsonDict["results"] as? [[String:AnyObject]] {
                        for item in data {
                            self.moviesArray.append(item)
                        }
                    }
                }
            case .failure(let error):
                
                if let errorMessage = response.response?.statusCode {
                    Utilities.createSimpleAlert(view: self, title: "The Movie DB", message: ErrorTreatment.jsonErrorTreatment(error: errorMessage))
                }
                print("Error Number : \(error)")
                break
            }
            Utilities.removeLoadingScreen(view: self.view)
            self.moviesCollectionView.reloadData()
        }
    }
}
