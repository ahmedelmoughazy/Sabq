//
//  HomePresenter.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol{
    
    private var homeView: HomeViewProtocol
    private var homeModel: HomeModelProtocol
    

    func loadHome() {
        homeModel.getSliders {(result) in
            do {
                let sliders = try (result.get() as! SliderResponse).slider
                let materials = try (result.get() as! SliderResponse).materials
                self.homeView.renderViewWithObjects(sliders: sliders!, materials: materials!)
            } catch {
                print(error)
            }
        }
    }

    func loadImages() {
        homeModel.getImages {(result) in
            do {
                let comics = try (result.get() as! ImageResponse).comics
                self.homeView.renderViewWithObjects(images: comics)
            } catch {
                print(error)
            }
        }
    }
    
    func loadVideos() {
        homeModel.getVideos {(result) in
            do {
                let comics = try (result.get() as! VideoResponse).comics
                self.homeView.renderViewWithObjects(videos: comics)
            } catch {
                print(error)
            }
        }
    }
    
    func loadArticles() {
        homeModel.getArticles {(result) in
            do {
                let materials = try (result.get() as! ArticleResponse).materials
                self.homeView.renderViewWithObjects(articles: materials)
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
