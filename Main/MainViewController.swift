//
//  ViewController.swift
//  WeatherForCats
//
//  Created by f f on 28.03.2024.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet private weak var city: UILabel!
    @IBOutlet private weak var currentTemperature: UILabel!
    @IBOutlet private weak var maxAndMinTemperatureForToday: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    var weatherService: WeatherServiceProtocol!
    private var hourlyForecasts: [HourlyWeatherModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
        getData()
    }
    
    private func setupUi(model: WeatherModel) {
        DispatchQueue.main.async {
            self.city.text = model.city
            self.currentTemperature.text = "\(model.currentTemperature)°"
            self.maxAndMinTemperatureForToday.text =
                "max: \(model.maxTemperatureForToday)°   min: \(model.minTemperatureForToday)°"
            
            self.collectionView.reloadData()
        }
    }
    
    private func getData() {
        weatherService.getCurrentWeather(city: "Moscow") { model in
            self.hourlyForecasts = model.hourlyForecast
            self.setupUi(model: model)
        }
    }
    
    //MARK: -UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = hourlyForecasts?.count else { return 0 }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherInfoCell", for: indexPath) as! WeatherInfoCell
        
        guard let model = hourlyForecasts?[indexPath.item] else {
            fatalError("collectionView.count == 0")
        }
        cell.bind(model: model)

        return cell
    }
}
