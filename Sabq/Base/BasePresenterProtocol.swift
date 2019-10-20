//
//  BasePresenterProtocol.swift
//  Sabq
//
//  Created by AhmedElmoughazy on 10/18/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

@objc
protocol PresenterLifeCycleProtocol {
    
    @objc
    optional func loadView()
    @objc
    optional func viewDidLoad()
    @objc
    optional func viewWillAppear()
    @objc
    optional func viewDidAppear()
    @objc
    optional func viewWillDisappear()
    @objc
    optional func viewDidDisappear()
}

protocol BasePresenterProtocol: PresenterLifeCycleProtocol{
    
}
