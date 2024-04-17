//
//  DailyWeatherModel.swift
//  WeatherForCats
//
//  Created by f f on 15.04.2024.
//

import Foundation

struct DailyWeatherModel {
    let date: Date
    let maxTemperatureForToday: Double
    let minTemperatureForToday: Double
    let avgTemperatureForToday: Double
    let weatherType: WeatherType
    
    init(date: Date, maxTemperatureForToday: Double, minTemperatureForToday: Double, avgTemperatureForToday: Double, weatherType: WeatherType) {
        self.date = date
        self.maxTemperatureForToday = maxTemperatureForToday
        self.minTemperatureForToday = minTemperatureForToday
        self.avgTemperatureForToday = avgTemperatureForToday
        self.weatherType = weatherType
    }
    
    init(dto: DailyForecastDto) {
        date = Date(timeIntervalSince1970: TimeInterval(dto.dateEpoch))
        maxTemperatureForToday = dto.averageDailyWeather.maxTemperature
        minTemperatureForToday = dto.averageDailyWeather.minTemperature
        avgTemperatureForToday = dto.averageDailyWeather.avgTemperature
        weatherType = WeatherType(rawValue: dto.averageDailyWeather.condition.code) ?? .sunny
    }
}
