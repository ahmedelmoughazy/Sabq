//
//  Int+Extensions.swift
//  Sabq
//
//  Created by AhmedElmoughazy on 10/25/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

extension Int {
    func localizedNumber() -> String {
        let formater = NumberFormatter()
        formater.numberStyle = .none
        formater.locale = NSLocale.current
        return formater.string(from: NSNumber(value: self))!
    }
}
