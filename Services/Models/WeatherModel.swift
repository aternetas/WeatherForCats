//
//  WeatherModel.swift
//  WeatherForCats
//
//  Created by f f on 03.04.2024.
//

import Foundation

struct WeatherModel {
    let city: String
    
    //current weather
    let currentTemperature: Double
    let weatherType: WeatherType
    let isDay: Bool
    
    //hourly forecast
    let hourlyForecast: [HourlyWeatherModel]
    
    //daily forecast
    let dailyForecast: [DailyWeatherModel]
    
    init(city: String, 
         currentTemperature: Double,
         weatherType: WeatherType,
         isDay: Bool,
         hourlyForecast: [HourlyWeatherModel],
         dailyForecast: [DailyWeatherModel]) {
        self.city = city
        self.currentTemperature = currentTemperature
        self.weatherType = weatherType
        self.isDay = isDay
        self.hourlyForecast = hourlyForecast
        self.dailyForecast = dailyForecast
    }
    
    init(dto: WeatherDataDto) {
        city = dto.location.city
        currentTemperature = dto.currentWeather.temperature
        weatherType = WeatherType(rawValue: dto.currentWeather.description.code) ?? .sunny
        isDay = dto.currentWeather.isDay == 1
        dailyForecast = dto.forecast.dailyForecast.map { DailyWeatherModel(dto: $0) }
        hourlyForecast = dto.forecast.dailyForecast[0].hourlyWeather.map { HourlyWeatherModel(dto: $0) } 
    }
}
