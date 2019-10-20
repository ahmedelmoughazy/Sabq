//
//  UIViewController+Extentions.swift
//  Sabq
//
//  Created by AhmedElmoughazy on 10/18/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit

extension UIViewController {
    /// use this if you add a ViewControllerScene to the Nib not a View
    static func loadViewControllerFromXib<Controller: UIViewController>() -> Controller {
        
        let nib = UINib(nibName: String(describing: self), bundle: Bundle.main)
        guard let controller =  nib.instantiate(withOwner: nil, options: nil).first as? Controller else {
            fatalError("failed to parse top level object in nib to \(String(describing: Controller.self))")
        }
        return controller
    }
}
