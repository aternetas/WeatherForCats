//
//  FavouriteCitiesTableViewCell.swift
//  WeatherForCats
//
//  Created by f f on 27.04.2024.
//

import UIKit

class FavouriteCityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(city: String) {
        cityLabel.text = city
    }
    
    func setupUI() {
//        let view = subviews.first(where: { $0.accessibilityIdentifier == "CellBackground" } )
//        view?.layer.cornerRadius = 30
        
    }

    //MARK: -UITableViewCell
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
