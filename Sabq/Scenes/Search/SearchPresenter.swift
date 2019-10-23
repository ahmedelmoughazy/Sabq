//
//  SearchPresenter.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class SearchPresenter: SearchPresenterProtocol{
    
    private var searchView: SearchViewProtocol
    private var searchModel: SearchModelProtocol

    required init(view: SearchViewProtocol, model: SearchModelProtocol) {
        searchView = view
        searchModel = model
    }
    
    
}
