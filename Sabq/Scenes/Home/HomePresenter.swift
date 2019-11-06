//
//  HomePresenter.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    private var homeView: HomeViewProtocol
    private var homeModel: HomeModelProtocol
    
    func loadHome() {
        homeModel.getResponse(service: NewsService.slider) {(result) in
            do {
                let sliders = try (result.get() as? APIResponse)?.slider
                let materials = try (result.get() as? APIResponse)?.materials
                guard let slidersList = sliders, let materialsList = materials else { return }
                self.homeView.renderViewWithObjects(sliders: slidersList, materials: materialsList)
            } catch {
                print(error)
                self.homeView.renderEmptyView()
            }
        }
    }

    func loadImages() {
        homeModel.getResponse(service: NewsService.images) {(result) in
            do {
                let comics = try (result.get() as? APIResponse)?.comics
                guard let results = comics else { return }
                self.homeView.renderViewWithObjects(images: results)
            } catch {
                print(error)
            }
        }
    }
    
    func loadVideos() {
        homeModel.getResponse(service: NewsService.videos) {(result) in
            do {
                let comics = try (result.get() as? APIResponse)?.comics
                guard let results = comics else { return }
                self.homeView.renderViewWithObjects(videos: results)
            } catch {
                print(error)
            }
        }
    }
    func loadArticles() {
        homeModel.getResponse(service: NewsService.articles) {(result) in
            do {
                let materials = try (result.get() as? APIResponse)?.materials
                guard let results = materials else { return }
                self.homeView.renderViewWithObjects(articles: results)
            } catch {
                print(error)
            }
        }
    }

    required init(view: HomeViewProtocol, model: HomeModelProtocol) {
        homeView = view
        homeModel = model
    }
    
}
