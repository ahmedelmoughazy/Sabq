//
//  DetailsProtocols.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

protocol DetailsPresenterProtocol: BasePresenterProtocol {
    func loadDetailsData()
}

protocol DetailsViewProtocol:BaseViewProtocol {
    func renderViewWithObject(material: Material)
}

protocol DetailsModelProtocol:BaseModelProtocol {
    func getData() -> Material
}
