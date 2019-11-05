//
//  APIResponse.swift
//  Sabq
//
//  Created by Ahmed Refaat on 11/5/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

struct APIResponse: Codable {
    
    let comics: [Material]?
    let slider: [Material]?
    let materials: [Material]?
    let code: Int?

}
