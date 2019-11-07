//
//  CommonViewController.swift
//  Sabq
//
//  Created by AhmedElmoughazy on 10/23/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit
import GoogleSignIn

class CommonViewController: BaseViewController<CommonPresenter>, CommonViewProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Common", comment: "tabbar item title")
    }
}
