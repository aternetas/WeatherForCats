//
//  AverageDailyWeatherDto.swift
//  WeatherForCats
//
//  Created by f f on 08.04.2024.
//

import Foundation

struct AverageDailyWeatherDto: Codable {
    let maxTemperature: Double
    let minTemperature: Double
    
    enum CodingKeys: String, CodingKey {
        case maxTemperature = "maxtemp_c"
        case minTemperature = "mintemp_c"
    }
}
