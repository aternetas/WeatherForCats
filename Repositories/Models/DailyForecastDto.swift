//
//  DailyForecastDto.swift
//  WeatherForCats
//
//  Created by f f on 08.04.2024.
//

import Foundation

struct DailyForecastDto: Codable {
    //MARK: -currently used
    let averageDailyWeather: AverageDailyWeatherDto
    
    //MARK: -currently unused
    let date: String
    let dateEpoch: Int
    let astro: AstroConditionsDto
    let hourlyWeather: HourlyWeatherDto
    
    enum CodingKeys: String, CodingKey {
        //MARK: -currently used
        case averageDailyWeather = "day"
        
        //MARK: -currently unused
        case date
        case dateEpoch = "date_epoch"
        case astro
        case hourlyWeather = "hour"
    }
}
