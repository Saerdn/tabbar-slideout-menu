//
//  MapsViewController.swift
//  TabBarSlideOutMenu
//
//  Created by Andreas Geisler on 20.06.16.
//  Copyright © 2016 Andreas Geisler. All rights reserved.
//

import UIKit

class MapsViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.menuButton.target = self.revealViewController()
        self.menuButton.action = #selector(MapsSideMenuRevealController.revealToggle(_:))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

