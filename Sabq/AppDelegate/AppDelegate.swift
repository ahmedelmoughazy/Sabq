//
//  AppDelegate.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/17/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupNetworking()
        window = UIWindow(frame: UIScreen.main.bounds)
   //     UIView.appearance().semanticContentAttribute = .forceRightToLeft
        
        NewsRouter.startRouting(at: window)
        return true
    }
}

