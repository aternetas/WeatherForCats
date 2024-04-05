//
//  WeatherModel.swift
//  WeatherForCats
//
//  Created by f f on 03.04.2024.
//

import Foundation

struct WeatherModel {
    let city: String
    let currentTemperature: Double
//    let maxTemperatureForToday: Int
//    let minTemperatureForToday: Int
    
    init(city: String, currentTemperature: Double) {
        self.city = city
        self.currentTemperature = currentTemperature
    }
    
    init(dto: WeatherDataDto) {
        city = dto.location.city
        currentTemperature = dto.conditions.temperature
    }
}
