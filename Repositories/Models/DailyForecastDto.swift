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
    let hourlyWeather: [HourlyWeatherDto]
    let date: String

    //MARK: -currently unused
    let dateEpoch: Int
    let astro: AstroConditionsDto
    
    enum CodingKeys: String, CodingKey {
        //MARK: -currently used
        case averageDailyWeather = "day"
        case hourlyWeather = "hour"
        case date

        //MARK: -currently unused
        case dateEpoch = "date_epoch"
        case astro
    }
}
