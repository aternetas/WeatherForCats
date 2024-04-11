//
//  HourModel.swift
//  WeatherForCats
//
//  Created by f f on 09.04.2024.
//

import Foundation

struct HourlyWeatherModel {
    let time: Date
    let iconCode: Int
    let temp: Double
    
    init(time: Date, icon: Int, temp: Double) {
        self.time = time
        self.iconCode = icon
        self.temp = temp
    }
    
    init(dto: HourlyWeatherDto) {
        time = Date(timeIntervalSince1970: TimeInterval(dto.timeEpoch))
        iconCode = dto.condition.code
        temp = dto.tempC
    }
}
