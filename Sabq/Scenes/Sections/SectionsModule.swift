//
//  SectionsModule.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class SectionsModule {
    class func getSectionsView() -> SectionsViewController {
        let sectionsView = SectionsViewController()
        let sectionsModel = SectionsModel()
        let presenter = SectionsPresenter(view: sectionsView, model: sectionsModel)
        
        sectionsView.setPresenter(presenter: presenter)
        
        return sectionsView
        
    }
}
