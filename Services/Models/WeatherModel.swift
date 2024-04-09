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
    let maxTemperatureForToday: Double
    let minTemperatureForToday: Double
    var hourlyForecast: [HourlyWeatherModel]
    
    init(city: String, 
         currentTemperature: Double,
         maxTemperatureForToday: Double,
         minTemperatureForToday: Double,
         hourlyForecast: [HourlyWeatherModel]) {
        self.city = city
        self.currentTemperature = currentTemperature
        self.maxTemperatureForToday = maxTemperatureForToday
        self.minTemperatureForToday = minTemperatureForToday
        self.hourlyForecast = hourlyForecast
    }
    
    init(dto: WeatherDataDto) {
        city = dto.location.city
        currentTemperature = dto.currentWeather.temperature
        
        if let dailyForecast = dto.forecast.dailyForecast.first {
            maxTemperatureForToday = dailyForecast.averageDailyWeather.maxTemperature
            minTemperatureForToday = dailyForecast.averageDailyWeather.minTemperature
            
            let perHour = dailyForecast.hourlyWeather
            var hourModels: [HourlyWeatherModel] = []
            perHour.forEach { hour in
                hourModels.append(
                    HourlyWeatherModel(time: hour.time, icon: hour.condition.icon, temp: hour.tempC)
                )
            }
            hourlyForecast = hourModels
            
        } else {
            maxTemperatureForToday = 0.0
            minTemperatureForToday = 0.0
            hourlyForecast = []
        }
    }
}
