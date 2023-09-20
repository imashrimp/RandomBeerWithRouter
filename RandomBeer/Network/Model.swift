//
//  Model.swift
//  RandomBeer
//
//  Created by 권현석 on 2023/09/19.
//

import Foundation

typealias MyBeer = [Beer]

struct Beer: Codable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
        case description
    }
}
