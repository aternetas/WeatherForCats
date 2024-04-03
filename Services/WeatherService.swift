//
//  WeatherService.swift
//  WeatherForCats
//
//  Created by f f on 03.04.2024.
//

import Foundation

class WeatherService {
    var weatherModel = WeatherModel(city: "", currentTemperature: 0, maxTemperatureForToday: 0, minTemperatureForToday: 0)
    
    func getCurrentWeather() -> WeatherModel {
        WeatherModel(city: "Panama", currentTemperature: 10, maxTemperatureForToday: 14, minTemperatureForToday: -1)
    }
}
