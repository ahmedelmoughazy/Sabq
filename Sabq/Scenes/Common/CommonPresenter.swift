//
//  CommonPresenter.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class CommonPresenter: CommonPresenterProtocol {
    
    private var commonView: CommonViewProtocol
    private var commonModel: CommonModelProtocol

    required init(view: CommonViewProtocol, model: CommonModelProtocol) {
        commonView = view
        commonModel = model
    }

}
