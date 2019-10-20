//
//  HomeModule.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class HomeModule {
    class func getHomeView() -> HomeViewController {
        let homeView = HomeViewController()
        let homeModel = HomeModel()
        let presenter = HomePresenter(view: homeView, model: homeModel)
        
        homeView.setPresenter(presenter: presenter)
        
        return homeView
        
    }
}
