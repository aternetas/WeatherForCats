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
        time.text = model.time.toHourMinute()
        weatherIcon.image = UIImage(named: "113")
//        weatherIcon.image = UIImage(named: "\(model.icon)")
        temperature.text = "\(model.temp)°"
    }
}
