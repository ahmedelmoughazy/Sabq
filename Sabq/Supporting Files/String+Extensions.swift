//
//  String+Extensions.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/21/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

extension String {
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd' 'HH':'mm' 'ss"
        let date = dateFormatter.date(from: self)
        return date
    }
    
    func convertToLongDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd' 'HH':'mm' 'ss"
        var date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "yyyy' 'MMM' 'dd"
        if let longDate = date {
            let stringDate = dateFormatter.string(from: longDate)
            date = dateFormatter.date(from: stringDate)
            return stringDate
        }
        return self
    }
}
