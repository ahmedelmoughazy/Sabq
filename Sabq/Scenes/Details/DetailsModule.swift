//
//  DetailsModule.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class DetailsModule {
    class func getDetailsView(material: Material) -> DetailsViewController {
        let detailsView = DetailsViewController()
        let detailsModel = DetailsModel(material: material)
        let presenter = DetailsPresenter(view: detailsView, model: detailsModel)
        
        detailsView.setPresenter(presenter: presenter)
        
        return detailsView
        
    }
}
