//
//  HourModel.swift
//  WeatherForCats
//
//  Created by f f on 09.04.2024.
//

import Foundation

struct HourlyWeatherModel {
    let time: Date
    let isDay: Bool
    let temp: Double
    let isNow: Bool
    let weatherType: WeatherType
    
    init(time: Date, isDay: Bool, temp: Double, isNow: Bool, weatherType: WeatherType) {
        self.time = time
        self.isDay = isDay
        self.temp = temp
        self.isNow = isNow
        self.weatherType = weatherType
    }
    
    init(dto: HourlyWeatherDto) {
        time = Date(timeIntervalSince1970: TimeInterval(dto.timeEpoch))
        isDay = dto.isDay == 1
        temp = dto.tempC
        isNow = false
        weatherType = WeatherType(rawValue: dto.condition.code) ?? .sunny
    }
}
