//
//  WeatherDescriptionDto.swift
//  WeatherForCats
//
//  Created by f f on 08.04.2024.
//

import Foundation

struct WeatherDescriptionDto: Codable {
    //MARK: -currently used
    let code: Int
    
    //MARK: -currently unused
    let text: String
    let icon: String
}
