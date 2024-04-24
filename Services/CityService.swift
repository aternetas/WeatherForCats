//
//  CityService.swift
//  WeatherForCats
//
//  Created by f f on 23.04.2024.
//

import Foundation

protocol CityServiceProtocol {
    func addCity(city: String)
    func getCities() -> [String]
    func removeCity(city: String)
}

class CityService: CityServiceProtocol {
    private let FAVOURITE_CITIES_KEY = "favouriteCities"
    
    func addCity(city: String) {
        var cities: [String] = getCities()
        cities.append(city)
        UserDefaults.standard.setValue(cities, forKey: FAVOURITE_CITIES_KEY)
    }
    
    func getCities() -> [String] {
        UserDefaults.standard.array(forKey: FAVOURITE_CITIES_KEY) as? [String] ?? []
    }
    
    func removeCity(city: String) {
        var cities: [String] = getCities()
        cities.removeAll(where: {$0 == city} )
        UserDefaults.standard.setValue(cities, forKey: FAVOURITE_CITIES_KEY)
    }
}
