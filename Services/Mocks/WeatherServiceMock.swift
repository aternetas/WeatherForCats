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
                                 weatherType: .blowingSnow,
                                 maxTemperatureForToday: 3.0,
                                 minTemperatureForToday: -1.0, isDay: true,
                                 hourlyForecast: [
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712786400)), isDay: false, temp: 9.4, isNow: false, weatherType: .fog), // четверг, 11 апреля 2024 г., 1:00:00
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712790000)), isDay: false, temp: 4.0, isNow: false, weatherType: .sunny), //четверг, 11 апреля 2024 г., 2:00:00
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712916511)), isDay: true, temp: 10.2, isNow: false, weatherType: .lightDrizzle), //пятница, 12 апреля 2024 г., 13:08:31
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712915000)), isDay: true, temp: -24.2, isNow: false, weatherType: .fog), //пятница, 12 апреля 2024 г., 12:43:20
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712925000)), isDay: true, temp: 0.0, isNow: false, weatherType: .heavyRain), //пятница, 12 апреля 2024 г., 15:30:00
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712804040)), isDay: false, temp: 0.5, isNow: false, weatherType: .fog), //четверг, 11 апреля 2024 г., 5:54:00
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712919409)), isDay: true, temp: 0, isNow: false, weatherType: .fog), // пятница, 12 апреля 2024 г., 13:56:49
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712119909)), isDay: true, temp: 0, isNow: false, weatherType: .cloudy), //первый: среда, 3 апреля 2024 г., 7:51:49
                                    HourlyWeatherModel(time: Date(timeIntervalSince1970: TimeInterval(1712923368)), isDay: true, temp: 0, isNow: false, weatherType: .fog) //пятница, 12 апреля 2024 г., 15:02:48
        ], dailyForecast: [
            DailyWeatherModel(date: "2024-04-16", maxTemperatureForToday: 10.0, minTemperatureForToday: 3.0, avgTemperatureForToday: 6.0, weatherType: .cloudy),
            DailyWeatherModel(date: "2024-04-17", maxTemperatureForToday: 14.0, minTemperatureForToday: 3.0, avgTemperatureForToday: 8.0, weatherType: .lightRain),
            DailyWeatherModel(date: "2024-04-18", maxTemperatureForToday: 13.5, minTemperatureForToday: 2.0, avgTemperatureForToday: 9.1, weatherType: .sunny)
        ])
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: {completionHandler(model)})
    }
}
