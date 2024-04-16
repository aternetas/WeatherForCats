//
//  WeatherInfoCellModel.swift
//  WeatherForCats
//
//  Created by f f on 15.04.2024.
//

import Foundation

struct WeatherInfoCellModel {
    let label: String
    let weatherType: WeatherType
    let temp: Double
    let isNow: Bool
    
    init(label: String, weatherType: WeatherType, temp: Double, isNow: Bool) {
        self.label = label
        self.weatherType = weatherType
        self.temp = temp
        self.isNow = isNow
    }
    
    init(hourlyWeatherModel: HourlyWeatherModel) {
        label = hourlyWeatherModel.isNow ? "Сейчас" : hourlyWeatherModel.time.toHourMinute()
        weatherType = hourlyWeatherModel.weatherType
        temp = hourlyWeatherModel.temp
        isNow = hourlyWeatherModel.isNow
    }
    
    init(dailyWeatherModel: DailyWeatherModel) {
        label = dailyWeatherModel.date.toDayOfTheWeek()
        weatherType = dailyWeatherModel.weatherType
        temp = dailyWeatherModel.avgTemperatureForToday
        isNow = false
    }
}
