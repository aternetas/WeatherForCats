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
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712786400)), icon: 1003, temp: 9.4),
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712790000)), icon: 1030, temp: 4.0),
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712793600)), icon: 1279, temp: 10.2),
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712797200)), icon: 1240, temp: -24.2),
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712786400)), icon: 1243, temp: 0.0),
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712790000)), icon: 1117, temp: 0.5),
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712790000)), icon: 1135, temp: 0),
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712797200)), icon: 1207, temp: 0)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {completionHandler(model)})
    }
}
