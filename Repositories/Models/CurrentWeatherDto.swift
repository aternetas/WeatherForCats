//
//  CurrentWeatherConditionsDto.swift
//  WeatherForCats
//
//  Created by f f on 05.04.2024.
//

import Foundation

struct CurrentWeatherDto: Codable {
    //MARK: -currently used
    let temperature: Double
    let description: WeatherDescriptionDto
    
    
    //MARK: -currently unused
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempF: Double
    let isDay: Int
    let windMph, windKph: Double
    let windDegree: Int
    let windDir: WindDir
    let pressureMB, pressureIn: Double
    let precipMm, precipIn: Double
    let humidity, cloud: Int
    let feelslikeC, feelslikeF: Double
    let visKM, visMiles: Double
    let uv: Double
    let gustMph, gustKph: Double
    
    enum CodingKeys: String, CodingKey {
        //MARK: -currently used
        case temperature = "temp_c"
        case description = "condition"
        
        //MARK: -currently unused
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempF = "temp_f"
        case isDay = "is_day"
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

//MARK: -currently unused
enum WindDir: String, Codable {
    case ese = "ESE"
    case s = "S"
    case sse = "SSE"
    case ssw = "SSW"
    case sw = "SW"
    case w = "W"
    case wsw = "WSW"
}
