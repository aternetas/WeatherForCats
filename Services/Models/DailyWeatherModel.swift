//
//  DailyWeatherModel.swift
//  WeatherForCats
//
//  Created by f f on 15.04.2024.
//

import Foundation

struct DailyWeatherModel {
    let date: String
    let maxTemperatureForToday: Double
    let minTemperatureForToday: Double
    let avgTemperatureForToday: Double
    
    init(date: String, maxTemperatureForToday: Double, minTemperatureForToday: Double, avgTemperatureForToday: Double) {
        self.date = date
        self.maxTemperatureForToday = maxTemperatureForToday
        self.minTemperatureForToday = minTemperatureForToday
        self.avgTemperatureForToday = avgTemperatureForToday
    }
    
    init(dto: DailyForecastDto) {
        date = dto.date
        maxTemperatureForToday = dto.averageDailyWeather.maxTemperature
        minTemperatureForToday = dto.averageDailyWeather.minTemperature
        avgTemperatureForToday = dto.averageDailyWeather.avgTemperature
    }
}
