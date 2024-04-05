//
//  ViewController.swift
//  WeatherForCats
//
//  Created by f f on 28.03.2024.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource {
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var currentTemperature: UILabel!
    @IBOutlet weak var maxAndMinTemperatureForToday: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    let weatherService = WeatherService(weatherRepository: WeatherRepository())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
        initUi()
    }
    
    func initUi() {
        weatherService.getCurrentWeather(city: "Moscow") { model in
            DispatchQueue.main.async {
                self.city.text = model.city
                self.currentTemperature.text = "\(model.currentTemperature)°"
            }
        }
    }
    
    //MARK: -UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherInfoCell", for: indexPath) as! WeatherInfoCell
        return cell
    }
}
