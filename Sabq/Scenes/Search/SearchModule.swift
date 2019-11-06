//
//  SearchModule.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class SearchModule {
    class func getSearchView() -> SearchViewController {
        let searchView = SearchViewController()
        let searchModel = SearchModel()
        let presenter = SearchPresenter(view: searchView, model: searchModel)
        
        searchView.setPresenter(presenter: presenter)
        
        return searchView
        
    }
}
