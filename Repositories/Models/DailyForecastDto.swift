//
//  DailyForecastDto.swift
//  WeatherForCats
//
//  Created by f f on 08.04.2024.
//

import Foundation

struct DailyForecastDto: Codable {
    let averageDailyWeather: AverageDailyWeatherDto
    
    let date: String
    let dateEpoch: Int
    let astro: AstroConditionsDto
    let hourlyWeather: HourlyWeatherDto
    
    enum CodingKeys: String, CodingKey {
        case averageDailyWeather = "day"
        
        case date
        case dateEpoch = "date_epoch"
        case astro
        case hourlyWeather = "hour"
    }
}
