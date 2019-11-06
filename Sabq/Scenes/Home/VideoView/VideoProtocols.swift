//
//  VideoProtocols.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

protocol VideoPresenterProtocol: BasePresenterProtocol {
    func loadVideoData()
}

protocol VideoViewProtocol: BaseViewProtocol {
    func renderViewWithObject(material: Material)
}

protocol VideoModelProtocol: BaseModelProtocol {
    func getVideo() -> Material?
}
