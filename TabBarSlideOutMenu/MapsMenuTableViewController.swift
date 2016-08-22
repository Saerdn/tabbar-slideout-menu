//
//  TableViewController.swift
//
//
//  Created by Andreas Geisler on 22.08.16.
//  Copyright © 2016 Andreas Geisler. All rights reserved.
//

import UIKit

class MapsMenuTableViewController: AccordionMenu {
    
    override func viewDidLoad() {
        let content = MenuContent()
        self.sections = content.getSections()

        super.viewDidLoad()
    }
}
