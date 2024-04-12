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
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712786400)), icon: 1003, temp: 9.4, isNow: false), // четверг, 11 апреля 2024 г., 1:00:00
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712790000)), icon: 1030, temp: 4.0, isNow: false), //четверг, 11 апреля 2024 г., 2:00:00
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712916511)), icon: 1279, temp: 10.2, isNow: false), //пятница, 12 апреля 2024 г., 13:08:31
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712915000)), icon: 1240, temp: -24.2, isNow: false), //пятница, 12 апреля 2024 г., 12:43:20
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712925000)), icon: 1243, temp: 0.0, isNow: false), //пятница, 12 апреля 2024 г., 15:30:00
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712804040)), icon: 1117, temp: 0.5, isNow: false), //четверг, 11 апреля 2024 г., 5:54:00
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712919409)), icon: 1135, temp: 0, isNow: false), // пятница, 12 апреля 2024 г., 13:56:49
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712119909)), icon: 1207, temp: 0, isNow: false), //первый: среда, 3 апреля 2024 г., 7:51:49
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712923368)), icon: 1207, temp: 0, isNow: false) //пятница, 12 апреля 2024 г., 15:02:48
        ])
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: {completionHandler(model)})
    }
}
