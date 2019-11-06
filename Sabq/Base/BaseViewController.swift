//
//  BaseViewController.swift
//  Sabq
//
//  Created by AhmedElmoughazy on 10/18/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit
import Foundation

class BaseViewController<Presenter: BasePresenterProtocol>: UIViewController, BaseViewProtocol {
    
    var presenter: Presenter!
    
    public func setPresenter (presenter: Presenter) {
        self.presenter = presenter
    }
}
