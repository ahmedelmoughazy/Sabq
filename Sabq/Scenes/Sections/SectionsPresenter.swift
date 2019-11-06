//
//  SectionsPresenter.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class SectionsPresenter: SectionsPresenterProtocol {
    
    private var sectionsView: SectionsViewProtocol
    private var sectionsModel: SectionsModelProtocol
    
    required init(view: SectionsViewProtocol, model: SectionsModelProtocol) {
        sectionsView = view
        sectionsModel = model
    }
    
}
