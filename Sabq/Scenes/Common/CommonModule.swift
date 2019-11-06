//
//  CommonModule.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class CommonModule {
    class func getCommonView() -> CommonViewController {
        let commonView = CommonViewController()
        let commonModel = CommonModel()
        let presenter = CommonPresenter(view: commonView, model: commonModel)
        
        commonView.setPresenter(presenter: presenter)
        
        return commonView
        
    }
}
