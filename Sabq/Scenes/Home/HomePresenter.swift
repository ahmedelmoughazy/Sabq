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
        homeModel.getSliders {(result) in
            do {
                let sliders = try (result.get() as? SliderResponse)?.slider
                let materials = try (result.get() as? SliderResponse)?.materials
                guard let slidersList = sliders, let materialsList = materials else { return }
                self.homeView.renderViewWithObjects(sliders: slidersList, materials: materialsList)
            } catch {
                print(error)
            }
        }
    }

    func loadImages() {
        homeModel.getImages {(result) in
            do {
                let comics = try (result.get() as? ImageResponse)?.comics
                guard let results = comics else { return }
                self.homeView.renderViewWithObjects(images: results)
            } catch {
                print(error)
            }
        }
    }
    
    func loadVideos() {
        homeModel.getVideos {(result) in
            do {
                let comics = try (result.get() as? VideoResponse)?.comics
                guard let results = comics else { return }
                self.homeView.renderViewWithObjects(videos: results)
            } catch {
                print(error)
            }
        }
    }
    func loadArticles() {
        homeModel.getArticles {(result) in
            do {
                let materials = try (result.get() as? ArticleResponse)?.materials
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
