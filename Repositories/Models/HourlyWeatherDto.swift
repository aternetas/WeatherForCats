//
//  HourlyWeatherDto.swift
//  WeatherForCats
//
//  Created by f f on 08.04.2024.
//

import Foundation

struct HourlyWeatherDto: Codable {
    //MARK: -currently used
    let timeEpoch: Int
    let tempC: Double
    let isDay: Int
    let condition: WeatherDescriptionDto
    
    //MARK: -currently unused
    let time: String
    let tempF: Double
    let windMph, windKph: Double
    let windDegree: Int
//    let windDir: WindDir
    let pressureMB, pressureIn: Double
    let precipMm, precipIn: Double
    let snowCM: Double
    let humidity, cloud: Int
    let feelslikeC, feelslikeF, windchillC, windchillF: Double
    let heatindexC, heatindexF, dewpointC, dewpointF: Double
    let willItRain, chanceOfRain, willItSnow, chanceOfSnow: Int
    let visKM, visMiles: Double
    let gustMph, gustKph: Double
    let uv: Double

    
    enum CodingKeys: String, CodingKey {
        //MARK: -currently used
        case timeEpoch = "time_epoch"
        case tempC = "temp_c"
        case isDay = "is_day"
        case condition
        
        //MARK: -currently unused
        case time
        case tempF = "temp_f"
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
//        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case snowCM = "snow_cm"
        case humidity, cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv
    }
}

