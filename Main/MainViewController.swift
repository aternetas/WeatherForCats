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
    @IBOutlet private weak var weatherForecastView: UIView!
    @IBOutlet private weak var hourlyForecastButton: UIButton!
    @IBOutlet private weak var threeDaysForecastButton: UIButton!
    @IBOutlet private weak var separator: UIView!
    private var underlineView: UIView?
    
    var weatherService: WeatherServiceProtocol!
    private var hourlyForecasts: [HourlyWeatherModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUi()
        getData()
    }
    
    @IBAction func onClickHourlyForecastButton(_ sender: UIButton) {
        setupUnderline(sender: sender)
    }
    
    @IBAction func onClickThreeDaysForecastButton(_ sender: UIButton) {
        setupUnderline(sender: sender)
    }
    
    private func setupUnderline(sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.underlineView?.frame = self.calcRectOfUnderline(sender: sender)
        }
    }
    
    private func setupUi() {
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        
        underlineView = UIView(frame: calcRectOfUnderline(sender: hourlyForecastButton))
        underlineView?.backgroundColor = UIColor(resource: .underline)
        weatherForecastView.addSubview(underlineView!)
        underlineView?.isHidden = true
    }
    
    private func calcRectOfUnderline(sender: UIButton) -> CGRect {
        let origin = CGPoint(x: sender.frame.minX, y: separator.frame.minY + 1)
        let size = CGSize(width: sender.frame.width, height: 1.0)
        
        return CGRect(origin: origin, size: size)
    }
    
    private func setupWeather(model: WeatherModel) {
        DispatchQueue.main.async {
            self.city.text = model.city
            self.currentTemperature.text = "\(model.currentTemperature)°"
            self.maxAndMinTemperatureForToday.text =
                "max: \(model.maxTemperatureForToday)°   min: \(model.minTemperatureForToday)°"
            
            self.collectionView.reloadData()
            
            self.underlineView?.isHidden = false
        }
    }
    
    private func getData() {
        weatherService.getCurrentWeather(city: "Moscow") { model in
            self.hourlyForecasts = model.hourlyForecast
            self.setupWeather(model: model)
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
