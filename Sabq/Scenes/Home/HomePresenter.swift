//
//  HomePresenter.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol{
    
    private var homeView: HomeViewProtocol
    private var homeModel: HomeModelProtocol
    

    func loadHome() {
        homeModel.getSliders {(result) in
            do {
                let results = try result.get() as! [Material]
                self.homeView.renderViewWithObjects(list: results)
            } catch {
                print(error)
            }
        }
    }

    required init(view: HomeViewProtocol, model: HomeModelProtocol) {
        homeView = view
        homeModel = model
    }
    
    
}
