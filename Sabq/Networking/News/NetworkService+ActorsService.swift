//
//  NetworkService+ProductService.swift
//
//  Created by AhmedElmoughazy on 10/17/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import Moya

extension NetworkManager {
    
    func getSliders(completion: @escaping (
        _ result: Swift.Result<SliderResponse, NetworkError>,
        _ statusCode: StatusCode?
        ) -> Void) {
        provider.request(MultiTarget(NewsService.slider)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    do {
                        let result = try JSONDecoder().decode(SliderResponse.self, from: response.data)
                        completion(.success(result), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                } else {
                    // 300-399 ,400-499
                    do {
                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                        businessError.type = .business
                        completion(.failure(businessError), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                }
                
            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError), nil)
            }
        }
        
    }
    
    func getImages(completion: @escaping (
        _ result: Swift.Result<ImageResponse, NetworkError>,
        _ statusCode: StatusCode?
        ) -> Void) {
        provider.request(MultiTarget(NewsService.images)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    do {
                        let result = try JSONDecoder().decode(ImageResponse.self, from: response.data)
                        completion(.success(result), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                } else {
                    // 300-399 ,400-499
                    do {
                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                        businessError.type = .business
                        completion(.failure(businessError), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                }
                
            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError), nil)
            }
        }
        
    }
    
    func getVideos(completion: @escaping (
        _ result: Swift.Result<VideoResponse, NetworkError>,
        _ statusCode: StatusCode?
        ) -> Void) {
        provider.request(MultiTarget(NewsService.videos)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    do {
                        let result = try JSONDecoder().decode(VideoResponse.self, from: response.data)
                        completion(.success(result), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                } else {
                    // 300-399 ,400-499
                    do {
                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                        businessError.type = .business
                        completion(.failure(businessError), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                }
                
            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError), nil)
            }
        }
        
    }
    
    func getArticles(completion: @escaping (
        _ result: Swift.Result<ArticleResponse, NetworkError>,
        _ statusCode: StatusCode?
        ) -> Void) {
        provider.request(MultiTarget(NewsService.articles)) { (result) in
            switch result {
            case .success(let response):
                if (200...299 ~= response.statusCode) {
                    do {
                        let result = try JSONDecoder().decode(ArticleResponse.self, from: response.data)
                        completion(.success(result), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                } else {
                    // 300-399 ,400-499
                    do {
                        var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
                        businessError.type = .business
                        completion(.failure(businessError), response.statusCode)
                    } catch {
                        completion(.failure(NetworkError.parseError), response.statusCode)
                    }
                }
                
            case .failure(let error):
                let customError = NetworkError(error: error)
                completion(.failure(customError), nil)
            }
        }
        
    }
}
