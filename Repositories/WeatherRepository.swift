//
//  WeatherRepository.swift
//  WeatherForCats
//
//  Created by f f on 05.04.2024.
//

import Foundation

class WeatherRepository {
    private let KEY: String = ""
    
    func getWeatherData(city: String, completionHandler: @escaping (WeatherDataDto) -> ()) {
        guard let url = getUrl(city: city) else { return }
        
        print(url)
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(WeatherDataDto.self, from: data)
                completionHandler(result)
            }
            catch {
                print("failed to convert json, error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    private func getUrl(city: String) -> URL? {
        URL(string: "https://api.weatherapi.com/v1/current.json?key=\(KEY)&q=\(city)&aqi=no")
    }
}
