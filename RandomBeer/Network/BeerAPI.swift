//
//  BeerAPI.swift
//  RandomBeer
//
//  Created by 권현석 on 2023/09/19.
//

import Foundation
import Alamofire

enum BeerAPI {
    
    case beers
    case single(id: Int)
    case random
    
    var baseURL: String {
        return "https://api.punkapi.com/v2/beers"
    }
    
    var endPoint: URL {
        switch self {
        case .beers:
            return URL(string: baseURL)!
        case .single(let id):
            return URL(string: baseURL + "/\(id)")!
        case .random:
            return URL(string: baseURL + "/random")!
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var header: HTTPHeaders {
        return ["": ""]
    }
}
