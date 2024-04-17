//
//  WeatherType.swift
//  WeatherForCats
//
//  Created by f f on 11.04.2024.
//

import Foundation

enum WeatherType: Int {
    case sunny = 1000
    case partlyCloudy = 1003
    case cloudy = 1006
    case overcast = 1009
    case mist = 1030
    case patchyRainPossible = 1063
    case patchySnowPossible = 1066
    case patchySleetPossible = 1069
    case patchyFreezingDrizzlePossible = 1072
    case thunderyOutbreaksPossible = 1087
    case blowingSnow = 1114
    case blizzard = 1117
    case fog = 1135
    case freezingFog = 1147
    case patchyLightDrizzle = 1150
    case lightDrizzle = 1153
    case freezingDrizzle = 1168
    case heavyFreezingDrizzle = 1171
    case patchyLightRain = 1180
    case lightRain = 1183
    case moderateRainAtTimes = 1186
    case moderateRain = 1189
    case heavyRainAtTimes = 1192
    case heavyRain = 1195
    case lightFreezingRain = 1198
    case moderateOrHeavyFreezingRain = 1201
    case lightSleet = 1204
    case moderateOrHeavySleet = 1207
    case patchyLightSnow = 1210
    case lightSnow = 1213
    case patchyModerateSnow = 1216
    case moderateSnow = 1219
    case patchyHeavySnow = 1222
    case heavySnow = 1225
    case icePellets = 1237
    case lightRainShower = 1240
    case moderateOrHeavyRainShower = 1243
    case torrentialRainShower = 1246
    case lightSleetShowers = 1249
    case moderateOrHeavySleetShowers = 1252
    case moderateOrHeavySnowShowers = 1258
    case lightShowersOfIcePellets = 1261
    case moderateOrHeavyShowersOfIcePellets = 1264
    case patchyLightRainWithThunder = 1273
    case moderateOrHeavyRainWithThunder = 1276
    case patchLightSnowWithThunder = 1279
    case moderateOrHeavySnowWithThunder = 1282
}

extension WeatherType {
    func getWeatherIconPath(isDay: Bool) -> String {
        let iconCode = switch self {
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
        
        return "\(isDay ? "Day/" : "Night")/\(iconCode)"
    }
}
