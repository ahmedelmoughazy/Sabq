//
//  DetailsPresenter.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class DetailsPresenter: DetailsPresenterProtocol{
    
    private var DetailsView: DetailsViewProtocol
    private var DetailsModel: DetailsModelProtocol

    required init(view: DetailsViewProtocol, model: DetailsModelProtocol) {
        DetailsView = view
        DetailsModel = model
    }
    
    
}
