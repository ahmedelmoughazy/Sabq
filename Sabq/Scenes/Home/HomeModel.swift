//
//  HomeModel.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/20/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import Foundation

class HomeModel: HomeModelProtocol {
    
    func getResponse(service: NewsService, compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getResponse(service: service) { (result, _) in
            do {
                let results = try result.get()
                compelation(.success(results))
            } catch {
                print(error)
                compelation(.failure(error))
            }
        }
    }
}
