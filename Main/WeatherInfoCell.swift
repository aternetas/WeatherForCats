//
//  WeatherInfoCell.swift
//  WeatherForCats
//
//  Created by f f on 01.04.2024.
//

import UIKit

class WeatherInfoCell: UICollectionViewCell {
    @IBOutlet private weak var time: UILabel!
    @IBOutlet private weak var weatherIcon: UIImageView!
    @IBOutlet private weak var temperature: UILabel!
    
    func bind(model: HourlyWeatherModel) {
        time.text = if model.isNow == true {
            "Cейчас"
        } else {
            model.time.toHourMinute()
        }
        weatherIcon.image = getImageIcon(weatherType: WeatherType(rawValue: model.iconCode) ?? WeatherType.sunny, isDay: true)
//        weatherIcon.image = UIImage(named: "\(model.icon)")
        temperature.text = "\(model.temp)°"
    }
    
    private func getImageIcon(weatherType: WeatherType, isDay: Bool) -> UIImage? {
        var iconName = 113

        iconName = switch weatherType {
        case .sunny: 113
        case .partlyCloudy: 116
        case .cloudy: 119
        case .overcast: 122
        case .mist: 143
        case .patchyRainPossible: 176
        case .patchySnowPossible: 179
        case .patchySleetPossible: 182
        case .patchyFreezingDrizzlePossible: 185
        case .thunderyOutbreaksPossible: 200
        case .blowingSnow: 227
        case .blizzard: 230
        case .fog: 248
        case .freezingFog: 260
        case .patchyLightDrizzle: 263
        case .lightDrizzle: 266
        case .freezingDrizzle: 281
        case .heavyFreezingDrizzle: 284
        case .patchyLightRain: 293
        case .lightRain: 296
        case .moderateRainAtTimes: 299
        case .moderateRain: 302
        case .heavyRainAtTimes: 305
        case .heavyRain: 308
        case .lightFreezingRain: 311
        case .moderateOrHeavyFreezingRain: 314
        case .lightSleet: 317
        case .moderateOrHeavySleet: 320
        case .patchyLightSnow: 323
        case .lightSnow: 326
        case .patchyModerateSnow: 329
        case .moderateSnow: 332
        case .patchyHeavySnow: 335
        case .heavySnow: 338
        case .icePellets: 350
        case .lightRainShower: 353
        case .moderateOrHeavyRainShower: 356
        case .torrentialRainShower: 359
        case .lightSleetShowers: 362
        case .moderateOrHeavySleetShowers: 365
        case .moderateOrHeavySnowShowers: 368
        case .lightShowersOfIcePellets: 371
        case .moderateOrHeavyShowersOfIcePellets: 374
        case .patchyLightRainWithThunder: 377
        case .moderateOrHeavyRainWithThunder: 386
        case .patchLightSnowWithThunder: 389
        case .moderateOrHeavySnowWithThunder: 392
        }
        
        return UIImage(named: isDay ? "Day/\(iconName)" : "Night/\(iconName)")
    }
}
