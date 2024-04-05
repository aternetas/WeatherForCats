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
    
    private func getCurrentWeather(city: String) {
        weatherRepository.getWeatherData(city: city) { dto in
            WeatherModel(city: dto.location.city, currentTemperature: dto.conditions.temperature)
        }
    }
}
