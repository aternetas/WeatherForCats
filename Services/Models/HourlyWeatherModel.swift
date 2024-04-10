//
//  HourModel.swift
//  WeatherForCats
//
//  Created by f f on 09.04.2024.
//

import Foundation

struct HourlyWeatherModel {
    let time: String
    let icon: String
    let temp: Double
    
    init(time: String, icon: String, temp: Double) {
        self.time = time
        self.icon = icon
        self.temp = temp
    }
    
    init(dto: HourlyWeatherDto) {
        time = dto.time
        icon = String(dto.condition.code)
        temp = dto.tempC
    }
}
