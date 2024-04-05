//
//  WeatherService.swift
//  WeatherForCats
//
//  Created by f f on 03.04.2024.
//

import Foundation

class WeatherService {
    var weatherModel = WeatherModel(city: "", currentTemperature: 0)
    
    func getCurrentWeather() -> WeatherModel {
        WeatherModel(city: "Panama", currentTemperature: 10)
    }
}
