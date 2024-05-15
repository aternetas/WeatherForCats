//
//  ViewController.swift
//  WeatherForCats
//
//  Created by f f on 28.03.2024.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SearchViewControllerProtocol, CLLocationManagerDelegate {
    
    @IBOutlet private weak var city: UILabel!
    @IBOutlet private weak var currentTemperature: UILabel!
    @IBOutlet private weak var maxAndMinTemperatureForToday: UILabel!
    
    @IBOutlet private weak var favouriteCityButton: UIButton!
    @IBOutlet private weak var figureButton: UIButton!
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var weatherForecastView: UIView!
    @IBOutlet private weak var hourlyForecastButton: UIButton!
    @IBOutlet private weak var threeDaysForecastButton: UIButton!
    @IBOutlet private weak var separator: UIView!
    
    var weatherService: WeatherServiceProtocol!
    var cityService: CityServiceProtocol!
    
    private let locationManager = CLLocationManager()
    
    private var underlineView = UIView()
    private var dailyForecasts: [DailyWeatherModel] = []
    private var hourlyForecasts: [HourlyWeatherModel] = []
    private var forecasts: [WeatherInfoCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUi()
        getData(cityForSearching: cityService.getCurrentCity())
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
            sender.isSelected ? cityService.addFavouriteCity(city: city) : cityService.removeCityFromFavourites(city: city)
        }
    }
    
    @IBAction func onFigureButtonClick(_ sender: UIButton) {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
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
        favouriteCityButton.configuration?.baseBackgroundColor = .clear
        
        figureButton.configuration?.baseBackgroundColor = .clear
        
        underlineView.frame = calcFrameOfUnderline(parentFrame: hourlyForecastButton.frame)
        underlineView.backgroundColor = UIColor(resource: .underline)
        weatherForecastView.addSubview(underlineView)
        underlineView.isHidden = true
    }
    
    private func setupFavouriteCityButtonState() {
        favouriteCityButton.isSelected = cityService.getCities().contains(where: { $0 == city.text } )
    }
    
    private func calcFrameOfUnderline(parentFrame: CGRect) -> CGRect {
        let origin = CGPoint(x: parentFrame.minX, y: separator.frame.minY + 1)
        let size = CGSize(width: parentFrame.width, height: 1.0)
        
        return CGRect(origin: origin, size: size)
    }
    
    private func setupWeather(model: WeatherModel) {
        DispatchQueue.main.async { [weak self] in
            self?.city.text = model.city
            self?.setupFavouriteCityButtonState()
            
            self?.currentTemperature.text = "\(model.currentTemperature)°"
            self?.maxAndMinTemperatureForToday.text =
            "max: \(model.dailyForecast[0].maxTemperatureForToday)°   min: \(model.dailyForecast[0].minTemperatureForToday)°"
            
            self?.underlineView.isHidden = false
        }
    }
    
    private func getData(cityForSearching: String) {
        weatherService.getCurrentWeather(city: cityForSearching) { [weak self] model in
            guard let _self = self else { return }
            var unsortedHourlyModels = model.hourlyForecast
            unsortedHourlyModels.append(HourlyWeatherModel(time: Date(), isDay: model.isDay, temp: model.currentTemperature, isNow: true, weatherType: model.weatherType))

            _self.hourlyForecasts = unsortedHourlyModels.sorted { $0.time < $1.time }
            _self.dailyForecasts = model.dailyForecast
            
            _self.fillOutTheForecast(forecastType: .hourlyForToday)
            _self.setupWeather(model: model)
        }
    }
    
    private func fillOutTheForecast(forecastType: ForecastType) {
        forecasts = switch forecastType {
            case .hourlyForToday: hourlyForecasts.map { WeatherInfoCellModel(hourlyWeatherModel: $0) }
            case .threeDays: dailyForecasts.map { WeatherInfoCellModel(dailyWeatherModel: $0) }
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    //MARK: -CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationManager.stopUpdatingLocation()
            location.convertToCityName { [weak self] cityName in
                self?.cityService.setCurrentCity(city: cityName)
                self?.getData(cityForSearching: cityName)
            }
        }
    }
    
    //MARK: -SearchViewControllerDelegat
    func update(cityForSearching: String?) {
        guard let cityForSearching = cityForSearching else { return }
        
        cityService.setCurrentCity(city: cityForSearching)
        getData(cityForSearching: cityForSearching)
    }
    
    func favouriteCityWasDeleted() {
        setupFavouriteCityButtonState()
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
