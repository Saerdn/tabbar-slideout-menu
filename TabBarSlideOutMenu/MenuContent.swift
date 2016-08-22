//
//  MenuContent.swift
//  AkkordeonV2
//
//  Created by Andreas Geisler on 22.08.16.
//  Copyright © 2016 Andreas Geisler. All rights reserved.
//
//  Class to deliver static and dynamic content for the menu
import Foundation

class MenuContent {

    var sections: [Section] = []

    init() {
        self.setSections()
    }

    func getSections()->Array<Section> {
        return self.sections
    }

    // Fill sections with content
    func setSections() {
        // Sections should be append in order as they are exptected to appear in the menu
        self.sections.append(Section(title: "Setting 1", content: ["Sound","Audio","Video"], isActive: false))
        self.sections.append(Section(title: "Setting 2", content: ["Language","Network","Display","Mail"], isActive: false))
        self.sections.append(Section(title: "Setting 3", content: [], isActive: false))
    }
}
