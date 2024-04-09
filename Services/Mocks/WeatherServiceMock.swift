//
//  WeatherServiceMock.swift
//  WeatherForCats
//
//  Created by f f on 09.04.2024.
//

import Foundation

class WeatherServiceMock: WeatherServiceProtocol {
    func getCurrentWeather(city: String, completionHandler: @escaping (WeatherModel) -> ()) {
        let model = WeatherModel(city: "Panama", currentTemperature: 0.0, maxTemperatureForToday: 3.0, minTemperatureForToday: -1.0)
        
        completionHandler(model)
    }
}
