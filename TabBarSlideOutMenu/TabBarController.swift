//
//  TabBarController.swift
//  TabBarSlideOutMenu
//
//  Created by Andreas Geisler on 19.08.16.
//  Copyright © 2016 Andreas Geisler. All rights reserved.
//
// Source: http://stackoverflow.com/questions/35467140/detect-when-uitabbar-item-selected-swift

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }

    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {

        // Close Menu if tab is changed
        // Exception: The view which called the menu
        if( viewController.restorationIdentifier != "menunavigationcontroller" ) {
            self.revealViewController().rightRevealToggleAnimated(true)
        }
        
        
    }
    

}
