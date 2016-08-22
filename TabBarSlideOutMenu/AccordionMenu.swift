//
//  AccordionMenu.swift
//  TabBarSlideOutMenu
//
//  Created by Andreas Geisler on 22.08.16.
//  Copyright © 2016 Andreas Geisler. All rights reserved.
//
//  "Abstract" class that converts a normal TableView into a accordion menu
//
//  Original source: http://stackoverflow.com/questions/35394191/making-simple-accordion-tableview-in-swift

import Foundation
import UIKit

class AccordionMenu: UITableViewController {
    
    // Contains complete content of menu
    var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    // MARK: Delegates
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sections.count
    }

    // Number of rows that a SPECIFIC SINGLE section has.
    // Thats why variable is called "section" and not just "row".
    override func tableView(tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int{
        if( self.sections[sectionIndex].isActive == true ) {
            return self.sections[sectionIndex].content.count
        } else {
            return 0
        }
    }

    // Height for header in section
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    // Height for row at IndexPath
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if( self.sections[indexPath.section].isActive == true){
            return 100
        }

        return 2;
    }

    // Design header of a section
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
        headerView.backgroundColor = UIColor.grayColor()
        headerView.tag = section

        let headerString = UILabel(frame: CGRect(x: 10, y: 10, width: tableView.frame.size.width-10, height: 30)) as UILabel
        headerString.text = self.sections[section].title
        headerView .addSubview(headerString)

        let headerTapped = UITapGestureRecognizer (target: self, action:#selector(AccordionMenu.sectionHeaderTapped(_:)))
        headerView .addGestureRecognizer(headerTapped)

        return headerView
    }

    // A header section has been tapped - (un)collapse it!
    func sectionHeaderTapped(recognizer: UITapGestureRecognizer) {
        // Get index of tapped title section
        let indexPath : NSIndexPath = NSIndexPath(forRow: 0, inSection:(recognizer.view?.tag as Int!)!)

        // Uncollapse if necessary
        if (indexPath.row == 0) {
            // Change status of section
            self.sections[indexPath.section].isActive = !self.sections[indexPath.section].isActive

            //reload specific section animated
            let range = NSMakeRange(indexPath.section, 1)
            let sectionToReload = NSIndexSet(indexesInRange: range)
            self.tableView.reloadSections(sectionToReload, withRowAnimation:UITableViewRowAnimation.Fade)
        }
    }

    // Design single cell of a section
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let CellIdentifier = "Cell"
        let cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(CellIdentifier)!

        if (self.sections[indexPath.section].isActive) {
            cell.textLabel?.text = self.sections[indexPath.section].content[indexPath.row]
            cell.backgroundColor = UIColor .greenColor()
        }

        return cell
    }
}