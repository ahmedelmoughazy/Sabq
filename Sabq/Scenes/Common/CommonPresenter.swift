//
//  CommonPresenter.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class CommonPresenter: CommonPresenterProtocol{
    
    private var homeView: CommonViewProtocol
    private var homeModel: CommonModelProtocol

    required init(view: CommonViewProtocol, model: CommonModelProtocol) {
        homeView = view
        homeModel = model
    }
    
    
}
