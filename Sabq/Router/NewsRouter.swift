//
//  PeopleRouter.swift
//  Movies
//
//  Created by Ahmed Refaat on 9/16/19.
//  Copyright © 2019 Ahmed Elmoughazy. All rights reserved.
//

import UIKit

class NewsRouter {
    
    private static var window : UIWindow?
    private static var navigationController : UINavigationController?
    private static var tabbarController : UITabBarController?
    
    class func present(at window: UIWindow?) {
        let homeViewController = HomeModule.getHomeView()
        self.navigationController = UINavigationController(rootViewController: homeViewController)
        self.tabbarController = UITabBarController()
        self.tabbarController?.viewControllers = [self.navigationController!]

        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
    }

}
