//
//  VideoModel.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class VideoModel: VideoModelProtocol {
    
    private var material: Material?
    
    init(material: Material) {
        self.material = material
    }
    
    func getVideo() -> Material? {
        return material
    }
}
