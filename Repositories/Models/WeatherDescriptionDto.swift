//
//  WeatherDescriptionDto.swift
//  WeatherForCats
//
//  Created by f f on 08.04.2024.
//

import Foundation

struct WeatherDescriptionDto: Codable {
    //MARK: -currently used
    let text: String
    
    //MARK: -currently unused
    let icon: String
    let code: Int
}
