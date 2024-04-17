//
//  WeatherInfoCellModel.swift
//  WeatherForCats
//
//  Created by f f on 15.04.2024.
//

import Foundation

struct WeatherInfoCellModel {
    let label: String
    let temp: Double
    let isNow: Bool
    let iconPath: String
    
    init(label: String, temp: Double, isNow: Bool, iconPath: String) {
        self.label = label
        self.temp = temp
        self.isNow = isNow
        self.iconPath = iconPath
    }
    
    init(hourlyWeatherModel: HourlyWeatherModel) {
        label = hourlyWeatherModel.isNow ? "Сейчас" : hourlyWeatherModel.time.toHourMinute()
        temp = hourlyWeatherModel.temp
        isNow = hourlyWeatherModel.isNow
        iconPath = hourlyWeatherModel.weatherType.getWeatherIconPath(isDay: hourlyWeatherModel.isDay)
    }
    
    init(dailyWeatherModel: DailyWeatherModel) {
        label = dailyWeatherModel.date.toDayOfTheWeek().lowercased()
        temp = dailyWeatherModel.avgTemperatureForToday
        isNow = false
        iconPath = dailyWeatherModel.weatherType.getWeatherIconPath(isDay: true)
    }
}
