//
//  WeatherDataDto.swift
//  WeatherForCats
//
//  Created by f f on 05.04.2024.
//

import Foundation

struct WeatherDataDto: Codable {
    let location: LocationDto
    let currentWeather: CurrentWeatherDto
    let forecast: ForecastDto
    
    enum CodingKeys: String, CodingKey {
        case location
        case currentWeather = "current"
        case forecast
    }
}
