//
//  FavouriteCitiesTableViewCell.swift
//  WeatherForCats
//
//  Created by f f on 27.04.2024.
//

import UIKit

class FavouriteCityCell: UITableViewCell {
    
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var cellBackground: UIView!
    
    func bind(city: String) {
        cityLabel.text = city
        cellBackground.layer.cornerRadius = 30
    }
}
