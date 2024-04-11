//
//  HourModel.swift
//  WeatherForCats
//
//  Created by f f on 09.04.2024.
//

import Foundation

struct HourlyWeatherModel {
    let time: Date
    let icon: String
    let temp: Double
    
    init(time: Date, icon: String, temp: Double) {
        self.time = time
        self.icon = icon
        self.temp = temp
    }
    
    init(dto: HourlyWeatherDto) {
        time = Date(timeIntervalSince1970: TimeInterval(dto.timeEpoch))
        icon = String(dto.condition.code)
        temp = dto.tempC
    }
}
