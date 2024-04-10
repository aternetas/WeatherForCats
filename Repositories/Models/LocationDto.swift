//
//  WeatherDataDto.swift
//  WeatherForCats
//
//  Created by f f on 05.04.2024.
//

import Foundation

struct LocationDto: Codable {
    //MARK: -currently used
    let city: String
    let localtime: String
    
    //MARK: -currently unused
    let region, country: String
    let lat, lon: Double
    let tzID: String
    let localtimeEpoch: Int
    
    enum CodingKeys: String, CodingKey {
        //MARK: -currently used
        case city = "name"
        case localtime
        
//        MARK: -currently unused
        case region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
    }
}
