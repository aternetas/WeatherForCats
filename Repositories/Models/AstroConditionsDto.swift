//
//  AstroConditionsDto.swift
//  WeatherForCats
//
//  Created by f f on 08.04.2024.
//

import Foundation

//MARK: -currently unused
struct AstroConditionsDto: Codable {
    let sunrise, sunset, moonrise, moonset: String
    let moonPhase: String
    let moonIllumination, isMoonUp, isSunUp: Int

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
        case isMoonUp = "is_moon_up"
        case isSunUp = "is_sun_up"
    }
}
