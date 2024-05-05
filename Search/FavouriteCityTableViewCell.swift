//
//  FavouriteCitiesTableViewCell.swift
//  WeatherForCats
//
//  Created by f f on 27.04.2024.
//

import UIKit

class FavouriteCityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cellBackground: UIView!
    
    func bind(city: String) {
        cityLabel.text = city
        cellBackground.layer.cornerRadius = 30
    }
}
