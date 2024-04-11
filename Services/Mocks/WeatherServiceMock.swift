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
                                    HourlyWeatherModel(time: "02:00", icon: "", temp: 2),
                                    HourlyWeatherModel(time: "03:00", icon: "", temp: 3),
                                    HourlyWeatherModel(time: "04:00", icon: "", temp: 3.2),
                                    HourlyWeatherModel(time: "05:00", icon: "", temp: 5),
                                    HourlyWeatherModel(time: "06:00", icon: "", temp: 5.2),
                                    HourlyWeatherModel(time: "07:00", icon: "", temp: 1),
                                    HourlyWeatherModel(time: "08:00", icon: "", temp: 2),
                                    HourlyWeatherModel(time: "09:00", icon: "", temp: 5.6),
                                    HourlyWeatherModel(time: "10:00", icon: "", temp: 5.4),
                                    HourlyWeatherModel(time: "11:00", icon: "", temp: 2),
                                    HourlyWeatherModel(time: "12:00", icon: "", temp: 0.9),
                                    HourlyWeatherModel(time: "13:00", icon: "", temp: 1),
                                    HourlyWeatherModel(time: "14:00", icon: "", temp: 2),
                                    HourlyWeatherModel(time: "15:00", icon: "", temp: 22.3),
                                    HourlyWeatherModel(time: "16:00", icon: "", temp: 1),
                                    HourlyWeatherModel(time: "17:00", icon: "", temp: 2)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {completionHandler(model)})
    }
}
