//
//  CityService.swift
//  WeatherForCats
//
//  Created by f f on 23.04.2024.
//

import Foundation

protocol CityServiceProtocol {
    func setCurrentCity(city: String)
    func getCurrentCity() -> String
    func addFavouriteCity(city: String)
    func getCities() -> [String]
    func removeCityFromFavourites(city: String)
}

class CityService: CityServiceProtocol {
    private let CURRENT_CITY_KEY = "currentCity"
    private let FAVOURITE_CITIES_KEY = "favouriteCities"
    private let DEFAULT_CITY_FOR_SEARCHING = "Adana"
    
    func setCurrentCity(city: String) {
        UserDefaults.standard.setValue(city, forKey: CURRENT_CITY_KEY)
    }
    
    func getCurrentCity() -> String {
        UserDefaults.standard.string(forKey: CURRENT_CITY_KEY) ?? DEFAULT_CITY_FOR_SEARCHING
    }
    
    func getCities() -> [String] {
        UserDefaults.standard.stringArray(forKey: FAVOURITE_CITIES_KEY) ?? []
    }
    
    func addFavouriteCity(city: String) {
        var cities: [String] = getCities()
        cities.append(city)
        UserDefaults.standard.setValue(cities, forKey: FAVOURITE_CITIES_KEY)
    }
    
    func removeCityFromFavourites(city: String) {
        var cities: [String] = getCities()
        cities.removeAll(where: {$0 == city} )
        UserDefaults.standard.setValue(cities, forKey: FAVOURITE_CITIES_KEY)
    }
}
