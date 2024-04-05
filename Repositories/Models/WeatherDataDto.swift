//
//  WeatherDataDto.swift
//  WeatherForCats
//
//  Created by f f on 05.04.2024.
//

import Foundation

struct WeatherDataDto: Codable {
    let location: WeatherDto
    let conditions: CurrentWeatherConditionsDto
    
    enum CodingKeys: String, CodingKey {
        case location
        case conditions = "current"
    }
}
