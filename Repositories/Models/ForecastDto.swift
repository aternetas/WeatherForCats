//
//  ForecastDto.swift
//  WeatherForCats
//
//  Created by f f on 08.04.2024.
//

import Foundation

struct ForecastDto: Codable {
    let dailyForecast: [DailyForecastDto]
    
    enum CodingKeys: String, CodingKey {
        case dailyForecast = "forecastday"
    }
}
