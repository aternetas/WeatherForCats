//
//  AverageDailyWeatherDto.swift
//  WeatherForCats
//
//  Created by f f on 08.04.2024.
//

import Foundation

struct AverageDailyWeatherDto: Codable {
    //MARK: -currently used
    let maxTemperature: Double
    let minTemperature: Double
    let avgTemperature: Double
    let condition: WeatherDescriptionDto
    
    //MARK: -currently unused
    let maxtempF, mintempF: Double
    let avgtempF, maxwindMph, maxwindKph: Double
    let totalprecipMm, totalprecipIn: Double
    let totalsnowCM: Int
    let avgvisKM: Double
    let avgvisMiles, avghumidity, dailyWillItRain, dailyChanceOfRain: Int
    let dailyWillItSnow, dailyChanceOfSnow: Int
    let uv: Int
    
    enum CodingKeys: String, CodingKey {
        //MARK: -currently used
        case maxTemperature = "maxtemp_c"
        case minTemperature = "mintemp_c"
        case avgTemperature = "avgtemp_c"
        case condition
        
        //MARK: -currently unused
        case maxtempF = "maxtemp_f"
        case mintempF = "mintemp_f"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case totalsnowCM = "totalsnow_cm"
        case avgvisKM = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case uv
    }
}
