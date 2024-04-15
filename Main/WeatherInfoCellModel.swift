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
    
    init(label: String, weatherType: WeatherType, temp: Double) {
        self.label = label
        self.weatherType = weatherType
        self.temp = temp
    }
    
    init(hourlyWeatherModel: HourlyWeatherModel) {
        label = hourlyWeatherModel.time.toHourMinute()
        weatherType = hourlyWeatherModel.weatherType
        temp = hourlyWeatherModel.temp
    }
}
