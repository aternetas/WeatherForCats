//
//  SearchViewController.swift
//  WeatherForCats
//
//  Created by f f on 24.04.2024.
//

import UIKit

protocol SearchViewControllerProtocol {
    func update(cityForSearching: String?)
}

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet private weak var citySearchBar: UISearchBar!
    @IBOutlet weak var favouriteCitiesTableView: UITableView!
    
    var delegate: SearchViewControllerProtocol?
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
        
        let deleteAction = UIContextualAction(style: .destructive, title: "🗑") { _, _, completionHandler in
            self.cityService?.removeCity(city: self.favouriteCities[indexPath.item])
            self.getFavouritesCities()
            completionHandler(true)
            tableView.reloadData()
        }
    
        deleteAction.backgroundColor = UIColor.black
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        
        return swipeConfiguration
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
        let cell = favouriteCitiesTableView.dequeueReusableCell(withIdentifier: "FavouriteCityTableViewCell", for: indexPath) as! FavouriteCityTableViewCell
        
        cell.bind(city: favouriteCities[indexPath.item])
        cell.setupUI()
        
        return cell
    }
}
