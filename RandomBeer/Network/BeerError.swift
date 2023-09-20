//
//  BeerError.swift
//  RandomBeer
//
//  Created by 권현석 on 2023/09/19.
//

import Foundation
import Alamofire

enum BeerError: Int, Error, LocalizedError {
    case missingParameter = 400
    
    var errorDescription: String {
        switch self {
        case .missingParameter:
            return "통신에 문제가 있습니다."
        }
    }
}
