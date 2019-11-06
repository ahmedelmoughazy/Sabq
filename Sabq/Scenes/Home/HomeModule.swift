//
//  HomeModule.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation
import UIKit

class HomeModule {
    class func getHomeView() -> HomeViewController {
        let homeView = HomeViewController()
        let homeModel = HomeModel()
        let presenter = HomePresenter(view: homeView, model: homeModel)
        
        homeView.setPresenter(presenter: presenter)
        
        var notification = #imageLiteral(resourceName: "ic_notification_icon")
        var user = #imageLiteral(resourceName: "img_user")
        notification = notification.withRenderingMode(.alwaysOriginal)
        user = user.withRenderingMode(.alwaysOriginal)
        
        homeView.navigationItem.leftBarButtonItem = UIBarButtonItem(image: notification,
                                                                    style: .plain,
                                                                    target: nil,
                                                                    action: nil)
        homeView.navigationItem.rightBarButtonItem = UIBarButtonItem(image: user,
                                                                     style: .plain,
                                                                     target: nil,
                                                                     action: nil)
        homeView.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "img_logo") )
        
        return homeView
        
    }
}
