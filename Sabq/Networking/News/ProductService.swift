//
//  ProductService.swift
//
//  Created by AhmedElmoughazy on 10/17/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import Moya

enum  NewsService {
    case slider
    case images
    case videos
    case articles
}

extension NewsService: TargetType {
    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .slider:
            return "/material/homepage-light-version"
        case .images:
            return "/studio/list-studio"
        case .videos:
            return "/studio/list-studio"
        case .articles:
            return "/material/articles"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .slider:
            return .get
            
        case .images:
            return .get
            
        case .videos:
            return .get
            
        case .articles:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .slider:
            return Data()
        case .images:
            return Data()
        case .videos:
            return Data()
        case .articles:
            return Data()
        }
    }
    
    var task: Task {        
        switch self {
        case .slider:
            let params: [String: Any] = [:]
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default)
            
        case .images:
            var params: [String: Any] = [:]
            params["type"] = "image"
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default)
            
        case .videos:
            var params: [String: Any] = [:]
            params["type"] = "video"
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default)
            
        case .articles:
            let params: [String: Any] = [:]
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
