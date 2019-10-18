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
        NetworkManager.shared.getSliders { (result, statusCode) in
            do {
                let results = try result.get().slider
                print(results[0].title)
            } catch {
                print(error)
            }
        }
        return true
    }
}

