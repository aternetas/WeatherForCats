//
//  SearchViewController.swift
//  WeatherForCats
//
//  Created by f f on 24.04.2024.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject {
    func update(cityForSearching: String?)
    func cityWasDeleted()
}

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet private weak var citySearchBar: UISearchBar!
    @IBOutlet private weak var favouriteCitiesTableView: UITableView!
    
    weak var delegate: SearchViewControllerProtocol?
    var cityService: CityServiceProtocol?
    
    private var favouriteCities: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getFavouritesCities()
        citySearchBar.delegate = self
        favouriteCitiesTableView.delegate = self
        favouriteCitiesTableView.dataSource = self
    }
    
    private func getFavouritesCities() {
        favouriteCities = cityService?.getCities() ?? []
    }
        
    //MARK: -UITableViewDelegate
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "🗑") { [weak self] _, _, completionHandler in
            guard let _self = self else { return }
            _self.cityService?.removeCity(city: _self.favouriteCities[indexPath.item])
            _self.getFavouritesCities()
            _self.delegate?.cityWasDeleted()
            tableView.reloadData()
            completionHandler(true)
        }
    
        deleteAction.backgroundColor = UIColor.black
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        
        return swipeConfiguration
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.update(cityForSearching: favouriteCities[indexPath.item])
        dismiss(animated: true)
    }
    
    //MARK: -UISearchBarDelegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text == "" {
            return
        }
        
        delegate?.update(cityForSearching: searchBar.text)
        dismiss(animated: true)
    }
    
    //MARK: -UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favouriteCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favouriteCitiesTableView.dequeueReusableCell(withIdentifier: "FavouriteCityCell", for: indexPath) as! FavouriteCityCell
        
        cell.bind(city: favouriteCities[indexPath.item])
        
        return cell
    }
}
