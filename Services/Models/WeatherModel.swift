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
    let weatherType: WeatherType
    let maxTemperatureForToday: Double
    let minTemperatureForToday: Double
    let isDay: Bool
    let hourlyForecast: [HourlyWeatherModel]
    
    init(city: String, 
         currentTemperature: Double,
         weatherType: WeatherType,
         maxTemperatureForToday: Double,
         minTemperatureForToday: Double,
         isDay: Bool,
         hourlyForecast: [HourlyWeatherModel]) {
        self.city = city
        self.currentTemperature = currentTemperature
        self.weatherType = weatherType
        self.maxTemperatureForToday = maxTemperatureForToday
        self.minTemperatureForToday = minTemperatureForToday
        self.isDay = isDay
        self.hourlyForecast = hourlyForecast
    }
    
    init(dto: WeatherDataDto) {
        city = dto.location.city
        currentTemperature = dto.currentWeather.temperature
        weatherType = WeatherType(rawValue: dto.currentWeather.description.code) ?? .sunny
        isDay = dto.currentWeather.isDay == 1
        
        if let dailyForecast = dto.forecast.dailyForecast.first {
            maxTemperatureForToday = dailyForecast.averageDailyWeather.maxTemperature
            minTemperatureForToday = dailyForecast.averageDailyWeather.minTemperature
            hourlyForecast = dailyForecast.hourlyWeather.map { HourlyWeatherModel(dto: $0) }
        } else {
            maxTemperatureForToday = 0.0
            minTemperatureForToday = 0.0
            hourlyForecast = []
        }
    }
}
