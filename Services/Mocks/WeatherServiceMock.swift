//
//  WeatherServiceMock.swift
//  WeatherForCats
//
//  Created by f f on 09.04.2024.
//

import Foundation

class WeatherServiceMock: WeatherServiceProtocol {
    func getCurrentWeather(city: String, completionHandler: @escaping (WeatherModel) -> ()) {
        let model = WeatherModel(city: "Panama",
                                 currentTemperature: 0.0,
                                 maxTemperatureForToday: 3.0,
                                 minTemperatureForToday: -1.0,
                                 hourlyForecast: [
                                    HourlyWeatherModel(time: "00:00", icon: "", temp: 0),
                                    HourlyWeatherModel(time: "01:00", icon: "", temp: 1),
                                    HourlyWeatherModel(time: "02:00", icon: "", temp: 2)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {completionHandler(model)})
    }
}
