//
//  DailyForecastDto.swift
//  WeatherForCats
//
//  Created by f f on 08.04.2024.
//

import Foundation

struct DailyForecastDto: Codable {
    let averageDailyWeather: AverageDailyWeatherDto
    
    enum CodingKeys: String, CodingKey {
        case averageDailyWeather = "day"
    }
}
