//
//  HomeModel.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class HomeModel: HomeModelProtocol {
    
    func getSliders(compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getSliders { (result, _) in
            do {
                let results = try result.get()
                compelation(.success(results))
            } catch {
                print(error)
            }
        }
    }
    
    func getImages(compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getImages { (result, _) in
            do {
                let results = try result.get()
                compelation(.success(results))
            } catch {
                print(error)
            }
        }
    }
    
    func getVideos(compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getVideos { (result, _) in
            do {
                let results = try result.get()
                compelation(.success(results))
            } catch {
                print(error)
            }
        }
    }
    
    func getArticles(compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getArticles { (result, _) in
            do {
                let results = try result.get()
                compelation(.success(results))
            } catch {
                print(error)
            }
        }
    }
}
