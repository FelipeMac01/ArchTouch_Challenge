//
//  Utilities.swift
//  ArchTouch_Challenge
//
//  Created by Felipe Mac on 03/02/19.
//  Copyright © 2019 Felipe Mac. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    
    static let loadingView = UIView()
    static let spinner = UIActivityIndicatorView()
    static let tmdb_key = "1f54bd990f1cdfb230adb312546d765d"
    
    //MARK: -LoadingScreen
    
    static func setLoadingScreen(view: UIView) {
        loadingView.isHidden = false
        loadingView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        loadingView.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        
        // Sets spinner
        spinner.style = UIActivityIndicatorView.Style.gray
        spinner.frame = CGRect(x: 0, y: 0, width: view.frame.maxX, height: view.frame.maxY)
        spinner.startAnimating()
        
        view.addSubview(loadingView)
        loadingView.addSubview(self.spinner)
    }
    
    static func removeLoadingScreen(view: UIView) {
        self.spinner.stopAnimating()
        self.loadingView.isHidden = true
        self.loadingView.removeFromSuperview()
    }
    
    //MARK: -Alerts
    
    static func createSimpleAlert(view: UIViewController, title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
        }
        alert.addAction(OKAction)
        view.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Add2ColorsLabel
    
    static func addTwoColorsInLabel(string1: String, sizeColorA: CGFloat, sizeColorB: CGFloat, string2:String) -> NSMutableAttributedString {
        
        let attrs1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: sizeColorA), NSAttributedString.Key.foregroundColor : UIColor.white]
        
        let attrs2 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: sizeColorB), NSAttributedString.Key.foregroundColor : UIColor.green]
        
        let attributedString1 = NSMutableAttributedString(string:string1, attributes:attrs1)
        
        let attributedString2 = NSMutableAttributedString(string:string2, attributes:attrs2)
        
        attributedString1.append(attributedString2)
        return attributedString1
    }
    

}

