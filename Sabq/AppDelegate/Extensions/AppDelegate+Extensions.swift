//
//  AppDelegate+Extensions.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/17/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

extension AppDelegate {
    
    func setupNetworking(){
        NetworkManager.shared = NetworkManager(config: NetworkDefaults())
    }
    
}
