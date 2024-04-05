//
//  CurrentWeatherConditionsDto.swift
//  WeatherForCats
//
//  Created by f f on 05.04.2024.
//

import Foundation

struct CurrentWeatherConditionsDto: Codable {
    let temperature: Double
    let description: WeatherDescription
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp_c"
        case description
    }
}

struct WeatherDescription: Codable {
    let text: String
}
