//
//  Network.swift
//  RandomBeer
//
//  Created by 권현석 on 2023/09/19.
//

import Foundation
import Alamofire

class Network {
    
    static let shared = Network()
    
    private init() { }
    
    func callRequest<T: Decodable>(type: T.Type, api: BeerAPI, completion: @escaping(Result<T, BeerError>) -> Void) {
        
        AF.request(api.endPoint)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(_):
                    let statusCode = response.response?.statusCode ?? 500
                    guard let error = BeerError(rawValue: statusCode) else { return }
                    completion(.failure(error))
                }
            }
    }
}
