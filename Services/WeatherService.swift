//
//  WeatherService.swift
//  WeatherForCats
//
//  Created by f f on 03.04.2024.
//

import Foundation

protocol WeatherServiceProtocol {
    func getCurrentWeather(city: String, completionHandler: @escaping (WeatherModel) -> ())
}

class WeatherService: WeatherServiceProtocol {
    private let weatherRepository: WeatherRepository
    
    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func getCurrentWeather(city: String, completionHandler: @escaping (WeatherModel) -> ()) {
        weatherRepository.getWeatherData(city: city) { dto in
            completionHandler(WeatherModel(dto: dto))
        }
    }
}
