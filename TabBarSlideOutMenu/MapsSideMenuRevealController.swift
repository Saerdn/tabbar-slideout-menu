//
//  MapsSideMenuRevealController.swift
//  TabBarSlideOutMenu
//
//  Created by Andreas Geisler on 20.06.16.
//  Copyright © 2016 Andreas Geisler. All rights reserved.
//

import UIKit

class MapsSideMenuRevealController: SWRevealViewController, SWRevealViewControllerDelegate {
    
    override func viewDidLoad() {
        self.rearViewRevealWidth = 100
        self.rearViewRevealOverdraw = 0
    }
}