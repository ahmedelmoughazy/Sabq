//
//  HomeProtocols.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

protocol HomePresenterProtocol: BasePresenterProtocol {
    func loadHome()
    func loadImages()
    func loadVideos()
    func loadArticles()
}

protocol HomeViewProtocol: BaseViewProtocol {
    func renderViewWithObjects(sliders: [Material], materials: [Material])
    func renderViewWithObjects(images: [Material])
    func renderViewWithObjects(videos: [Material])
    func renderViewWithObjects(articles: [Material])
    func renderEmptyView()
}

protocol HomeModelProtocol: BaseModelProtocol {
    func getResponse(service: NewsService, compelation: @escaping (Result<Any, Error>) -> Void)
}
