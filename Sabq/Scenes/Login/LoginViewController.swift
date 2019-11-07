//
//  LoginViewController.swift
//  Sabq
//
//  Created by Ahmed Refaat on 11/7/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {

    @IBOutlet private weak var googleSignIn: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().presentingViewController = self
    }

}
