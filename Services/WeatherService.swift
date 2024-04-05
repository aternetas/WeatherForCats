//
//  WeatherService.swift
//  WeatherForCats
//
//  Created by f f on 03.04.2024.
//

import Foundation

class WeatherService {
    let weatherRepository: WeatherRepository
    
    init(weatherRepository: WeatherRepository) {
        self.weatherRepository = weatherRepository
    }
    
    func getCurrentWeather(city: String, completionHandler: @escaping (WeatherModel) -> () ) {
        weatherRepository.getWeatherData(city: city) { dto in
            completionHandler(WeatherModel(dto: dto))
        }
    }
}
