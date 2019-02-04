//
//  MovieCollectionCell.swift
//  ArchTouch_Challenge
//
//  Created by Pedro Machado on 04/02/19.
//  Copyright © 2019 Felipe Mac. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var movie_background: UIImageView!
    @IBOutlet weak var movie_nameLbl: UILabel!
    @IBOutlet weak var release_dateLbl: UILabel!
    
    func configureLayout() {
        movie_background.layer.borderColor = UIColor.white.cgColor
        movie_background.layer.borderWidth = 1
    }
    
    var object : Movie? {
        didSet {
            
            configureLayout()
            
            if let data = object {
                
                self.movie_background.image = #imageLiteral(resourceName: "theMovieDbLogo")
                self.movie_background.kf.indicatorType = .activity
                self.movie_background.kf.indicator?.startAnimatingView()
                
                if let original_title  = data.original_title {
                    movie_nameLbl.text = original_title
                }
                if let release_date = data.release_date {
                    release_dateLbl.text = release_date
                }
                if let imageUrl = data.poster_path {
                    
                    if let url = URL(string: "http://image.tmdb.org/t/p/w185\(imageUrl)") {
                        DispatchQueue.main.async {
                            self.movie_background.kf.setImage(with: url)
                            self.movie_background.kf.indicator?.stopAnimatingView()
                        }
                    }
                }else{
                    self.movie_background.image = #imageLiteral(resourceName: "theMovieDbLogo")
                }
            }
        }
    }
}
