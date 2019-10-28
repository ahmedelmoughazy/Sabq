//
//  DetailsPresenter.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class DetailsPresenter: DetailsPresenterProtocol {
    
    private var detailsView: DetailsViewProtocol
    private var detailsModel: DetailsModelProtocol

    required init(view: DetailsViewProtocol, model: DetailsModelProtocol) {
        detailsView = view
        detailsModel = model
    }
    
    func loadDetailsData() {
        let data = detailsModel.getData()
        guard let material = data else { return }
        detailsView.renderViewWithObject(material: material)
    }
}
