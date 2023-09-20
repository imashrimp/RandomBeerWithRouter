//
//  Router.swift
//  RandomBeer
//
//  Created by 권현석 on 2023/09/20.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
case beers
case single(id: Int)
case random
    
    private var baseURL: URL {
        return URL(string: "https://api.punkapi.com/"
        )!
    }
    
    private var path: String {
        switch self {
        case .beers:
            return "v2/beers"
        case .single(let id):
            return "v2/beers/\(id)"
        case .random:
            return "v2/beers/random"
        }
    }
    
    private var method: HTTPMethod {
        return .get
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        return request
    }
    
    
    
    
}
