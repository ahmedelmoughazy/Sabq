//
//  HomeModel.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class DetailsModel: DetailsModelProtocol {
    
    private var material: Material?
    
    init(material: Material) {
        self.material = material
    }
    
    func getData() -> Material {
        return material!
    }
}
