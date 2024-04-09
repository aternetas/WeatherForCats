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
    private var weatherModel: WeatherModel!
    private var hourlyModelPos = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
        initUi()
    }
    
    private func initUi() {
        weatherService.getCurrentWeather(city: "Moscow") { model in
            self.weatherModel = model
            
            DispatchQueue.main.async {
                self.city.text = model.city
                self.currentTemperature.text = "\(model.currentTemperature)°"
                self.maxAndMinTemperatureForToday.text =
                    "max: \(model.maxTemperatureForToday)°   min: \(model.minTemperatureForToday)°"
            }
        }
    }
    
    //MARK: -UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        weatherModel.hourlyForecast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherInfoCell", for: indexPath) as! WeatherInfoCell
        
        cell.bind(model: weatherModel.hourlyForecast[hourlyModelPos])
        hourlyModelPos += 1
        
        return cell
    }
}
