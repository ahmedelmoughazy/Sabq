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
                let sliders = try (result.get() as! SliderResponse).slider
                let materials = try (result.get() as! SliderResponse).materials
                self.homeView.renderViewWithObjects(sliders: sliders, materials: materials)
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
