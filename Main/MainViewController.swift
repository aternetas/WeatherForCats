//
//  ViewController.swift
//  WeatherForCats
//
//  Created by f f on 28.03.2024.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SearchViewControllerProtocol {
    
    private let DEFAULT_CITY_FOR_SEARCHING = "Moscow"
    
    @IBOutlet private weak var city: UILabel!
    @IBOutlet private weak var currentTemperature: UILabel!
    @IBOutlet private weak var maxAndMinTemperatureForToday: UILabel!
    
    @IBOutlet weak var favouriteCityButton: UIButton!
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var weatherForecastView: UIView!
    @IBOutlet private weak var hourlyForecastButton: UIButton!
    @IBOutlet private weak var threeDaysForecastButton: UIButton!
    @IBOutlet private weak var separator: UIView!
    
    var weatherService: WeatherServiceProtocol!
    var cityService: CityServiceProtocol!
    
    private var underlineView = UIView()
    private var dailyForecasts: [DailyWeatherModel] = []
    private var hourlyForecasts: [HourlyWeatherModel] = []
    private var forecasts: [WeatherInfoCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUi()
        getData(cityForSearching: DEFAULT_CITY_FOR_SEARCHING)
    }
    
    @IBAction func onSearchIconClick(_ sender: Any) {
        if let searchViewController = storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as? SearchViewController {
            searchViewController.delegate = self
            searchViewController.cityService = cityService
            searchViewController.modalPresentationStyle = .automatic
            present(searchViewController, animated: true)
        }
    }
    
    @IBAction func onStarButtonClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if let city = city.text {
            sender.isSelected ? cityService.addCity(city: city) : cityService.removeCity(city: city)
        }
        
        setupFavouriteCityButton()
    }
    
    @IBAction private func onClickHourlyForecastButton(_ sender: UIButton) {
        setupUnderline(parentFrame: sender.frame)
        fillOutTheForecast(forecastType: .hourlyForToday)
    }
    
    @IBAction private func onClickThreeDaysForecastButton(_ sender: UIButton) {
        setupUnderline(parentFrame: sender.frame)
        fillOutTheForecast(forecastType: .threeDays)
    }
    
    private func setupUnderline(parentFrame: CGRect) {
        UIView.animate(withDuration: 0.3) {
            self.underlineView.frame = self.calcFrameOfUnderline(parentFrame: parentFrame)
        }
    }
    
    private func setupUi() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        
        favouriteCityButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
        favouriteCityButton.setImage(UIImage(systemName: "star"), for: .normal)
        
        underlineView.frame = calcFrameOfUnderline(parentFrame: hourlyForecastButton.frame)
        underlineView.backgroundColor = UIColor(resource: .underline)
        weatherForecastView.addSubview(underlineView)
        underlineView.isHidden = true
    }
    
    private func calcFrameOfUnderline(parentFrame: CGRect) -> CGRect {
        let origin = CGPoint(x: parentFrame.minX, y: separator.frame.minY + 1)
        let size = CGSize(width: parentFrame.width, height: 1.0)
        
        return CGRect(origin: origin, size: size)
    }
    
    private func setupWeather(model: WeatherModel) {
        DispatchQueue.main.async {
            self.city.text = model.city
            self.setupFavouriteCityButton()
            
            self.currentTemperature.text = "\(model.currentTemperature)°"
            self.maxAndMinTemperatureForToday.text =
            "max: \(model.dailyForecast[0].maxTemperatureForToday)°   min: \(model.dailyForecast[0].minTemperatureForToday)°"
            
            self.underlineView.isHidden = false
        }
    }
    
    private func getData(cityForSearching: String) {
        weatherService.getCurrentWeather(city: cityForSearching) { model in
            var unsortedHourlyModels = model.hourlyForecast
            unsortedHourlyModels.append(HourlyWeatherModel(time: Date(), isDay: model.isDay, temp: model.currentTemperature, isNow: true, weatherType: model.weatherType))

            self.hourlyForecasts = unsortedHourlyModels.sorted { $0.time < $1.time }
            self.dailyForecasts = model.dailyForecast
            
            self.fillOutTheForecast(forecastType: .hourlyForToday)
            self.setupWeather(model: model)
        }
    }
    
    private func fillOutTheForecast(forecastType: ForecastType) {
        forecasts = switch forecastType {
            case .hourlyForToday: hourlyForecasts.map { WeatherInfoCellModel(hourlyWeatherModel: $0) }
            case .threeDays: dailyForecasts.map { WeatherInfoCellModel(dailyWeatherModel: $0) }
        }
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    //MARK: -SearchViewControllerDelegat
    func update(cityForSearching: String?) {
        guard let cityForSearching = cityForSearching else { return }
        
        getData(cityForSearching: cityForSearching)
    }
    
    internal func setupFavouriteCityButton() {
        favouriteCityButton.isSelected = cityService.getCities().contains(where: { $0 == city.text } )
    }
    
    //MARK: -UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        forecasts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherInfoCell", for: indexPath) as! WeatherInfoCell  
        cell.bind(model: forecasts[indexPath.item])
        return cell
    }
    
    //MARK: -UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: !forecasts[indexPath.item].isNow ? 64 : 75, height: 146)
    }
}
