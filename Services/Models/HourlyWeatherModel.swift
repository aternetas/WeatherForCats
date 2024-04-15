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
    let iconCode: Int
    let temp: Double
    let isNow: Bool
    
    init(time: Date, isDay: Bool, icon: Int, temp: Double, isNow: Bool) {
        self.time = time
        self.isDay = isDay
        self.iconCode = icon
        self.temp = temp
        self.isNow = isNow
    }
    
    init(dto: HourlyWeatherDto) {
        time = Date(timeIntervalSince1970: TimeInterval(dto.timeEpoch))
        isDay = dto.isDay == 1 ? true : false
        iconCode = dto.condition.code
        temp = dto.tempC
        isNow = false
    }
}
