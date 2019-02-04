//
//  TabBarPrincipalViewController.swift
//  ArchTouch_Challenge
//
//  Created by Felipe Mac on 03/02/19.
//  Copyright © 2019 Felipe Mac. All rights reserved.
//

import UIKit

class TabBarPrincipalViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configurDisplay()
    }
    
    //MARK: - Functions
    
    func configurDisplay() {
        self.tabBar.backgroundImage = UIImage(named: "backTabBlack.png")
        self.tabBar.tintColor = UIColor.white
        self.tabBar.autoresizesSubviews = false
        self.tabBar.clipsToBounds = true
    }
}
