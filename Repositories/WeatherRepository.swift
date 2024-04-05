//
//  WeatherRepository.swift
//  WeatherForCats
//
//  Created by f f on 05.04.2024.
//

import Foundation

class WeatherRepository {
    let KEY: String = ""
    
    private func getUrl(city: String) -> URL? {
        URL(string: "https://api.weatherapi.com/v1/current.json?key=\(KEY)&q=\(city)&aqi=no")
    }
    
    func getWeatherData(city: String, completionHandler: @escaping (WeatherDataDto) -> ()) {
        guard let url = getUrl(city: city) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response, error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            var result: WeatherDataDto?
            do {
                result = try JSONDecoder().decode(WeatherDataDto.self, from: data)
            }
            catch {
                print("failed to convert json, error: \(error.localizedDescription)")
            }
            
            guard let result = result else { return }
            completionHandler(result)
        }
        
        task.resume()
    }
}
