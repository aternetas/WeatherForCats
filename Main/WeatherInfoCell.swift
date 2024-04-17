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
    
    func bind(model: WeatherInfoCellModel) {
        time.text = model.label
        backgroundColor = UIColor(resource: model.isNow ? .nowCellBackground : .historyCellBackground)
        weatherIcon.image = UIImage(named: model.iconPath)
        temperature.text = "\(model.temp)°"
    }
}
