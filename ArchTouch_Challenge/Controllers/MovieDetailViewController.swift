//
//  MovieDetailViewController.swift
//  ArchTouch_Challenge
//
//  Created by Pedro Machado on 04/02/19.
//  Copyright © 2019 Felipe Mac. All rights reserved.
//

import UIKit
import Alamofire

class MovieDetailViewController: UIViewController {

    var movieID = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureLayout()
    }
    
    //MARK: Functions
    
    func configureLayout() {
        
    }
    
    //MARK: Api's Call
    
    func getMovieDetail(movieID:Int) {
        
        Utilities.setLoadingScreen(view: self.view)
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        
        let url = "https://api.themoviedb.org/3/movie/\(movieID)?api_key=1f54bd990f1cdfb230adb312546d765d&language=en-US"
        
        manager.request("\(url)", method: .get, parameters: nil).responseJSON { response in
            switch (response.result) {
            case .success:
                if let jsonDict = response.result.value as? [String:AnyObject] {
                    
                }
            case .failure(let error):
                
                if let errorMessage = response.response?.statusCode {
                    Utilities.createSimpleAlert(view: self, title: "The Movie DB", message: ErrorTreatment.jsonErrorTreatment(error: errorMessage))
                }
                print("Error Number : \(error)")
                break
            }
            Utilities.removeLoadingScreen(view: self.view)
        }
    }
}

