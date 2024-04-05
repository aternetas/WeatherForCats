//
//  WeatherDataDto.swift
//  WeatherForCats
//
//  Created by f f on 05.04.2024.
//

import Foundation

struct WeatherDataDto: Codable {
    let city: String
    let localtime: String
    
    enum CodingKeys: String, CodingKey {
        case city = "name"
        case localtime
    }
}
