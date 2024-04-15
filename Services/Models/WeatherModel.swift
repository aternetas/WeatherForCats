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
    let iconCode: Int
    let maxTemperatureForToday: Double
    let minTemperatureForToday: Double
    let isDay: Bool
    let hourlyForecast: [HourlyWeatherModel]
    
    init(city: String, 
         currentTemperature: Double,
         iconCode: Int,
         maxTemperatureForToday: Double,
         minTemperatureForToday: Double,
         isDay: Bool,
         hourlyForecast: [HourlyWeatherModel]) {
        self.city = city
        self.currentTemperature = currentTemperature
        self.iconCode = iconCode
        self.maxTemperatureForToday = maxTemperatureForToday
        self.minTemperatureForToday = minTemperatureForToday
        self.isDay = isDay
        self.hourlyForecast = hourlyForecast
    }
    
    init(dto: WeatherDataDto) {
        city = dto.location.city
        currentTemperature = dto.currentWeather.temperature
        iconCode = dto.currentWeather.description.code
        
        if let dailyForecast = dto.forecast.dailyForecast.first {
            maxTemperatureForToday = dailyForecast.averageDailyWeather.maxTemperature
            minTemperatureForToday = dailyForecast.averageDailyWeather.minTemperature
            isDay = dailyForecast.hourlyWeather[0].isDay == 0
            
            hourlyForecast = dailyForecast.hourlyWeather.map { HourlyWeatherModel(dto: $0) }
        } else {
            maxTemperatureForToday = 0.0
            minTemperatureForToday = 0.0
            isDay = true
            hourlyForecast = []
        }
    }
}
