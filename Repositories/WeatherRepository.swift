//
//  WeatherRepository.swift
//  WeatherForCats
//
//  Created by f f on 05.04.2024.
//

import Foundation

class WeatherRepository {
    private let KEY: String
    
    init() {
        KEY = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as! String
    }
    
    func getWeatherData(city: String, completionHandler: @escaping (WeatherDataDto) -> ()) {
        guard let url = getUrl(city: city) else { return }
        
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
        if (KEY == "") {
            fatalError("api-key is missing")
        }
        
        return URL(string: "https://api.weatherapi.com/v1/forecast.json?key=\(KEY)&q=\(city)&days=3&aqi=no&alerts=no")
    }
}
