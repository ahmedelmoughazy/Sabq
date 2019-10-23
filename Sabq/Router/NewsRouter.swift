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
        
        var notification = UIImage(named: "ic_notification_icon")
        var user = UIImage(named: "img_user")
        notification = notification?.withRenderingMode(.alwaysOriginal)
        user = user?.withRenderingMode(.alwaysOriginal)
        
        homeViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: notification, style:.plain, target: nil, action: nil)
        homeViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(image: user, style:.plain, target: nil, action: nil)
        
        homeViewController.navigationItem.titleView = UIImageView(image: UIImage(named: "img_logo"))
        self.navigationController = UINavigationController(rootViewController: homeViewController)
        self.tabbarController = UITabBarController()
        self.tabbarController?.viewControllers = [self.navigationController!]

        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
    }

    class func setRTL() {
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
    }
}
