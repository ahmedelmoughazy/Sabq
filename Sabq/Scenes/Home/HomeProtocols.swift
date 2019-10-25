//
//  HomeProtocols.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation
import Result

protocol HomePresenterProtocol: BasePresenterProtocol {
    func loadHome()
    func loadImages()
    func loadVideos()
    func loadArticles()
}

protocol HomeViewProtocol:BaseViewProtocol {
    func renderViewWithObjects(sliders: [Material], materials: [Material])
    func renderViewWithObjects(images: [Material])
    func renderViewWithObjects(videos: [Material])
    func renderViewWithObjects(articles: [Material])
}

protocol HomeModelProtocol:BaseModelProtocol {

    func getSliders(compelation: @escaping (Result<Any, AnyError>) -> Void)
    
    func getImages(compelation: @escaping (Result<Any, AnyError>) -> Void)
    
    func getVideos(compelation: @escaping (Result<Any, AnyError>) -> Void)
    
    func getArticles(compelation: @escaping (Result<Any, AnyError>) -> Void)
}
