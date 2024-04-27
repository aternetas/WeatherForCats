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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        citySearchBar.delegate = self
        favouriteCitiesTableView.delegate = self
        favouriteCitiesTableView.dataSource = self
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
        cityService?.getCities().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favouriteCitiesTableView.dequeueReusableCell(withIdentifier: "FavouriteCityTableViewCell", for: indexPath) as! FavouriteCityTableViewCell
        
        if let favouriteCities = cityService?.getCities() {
            cell.bind(city: favouriteCities[indexPath.item])
        }
        return cell
    }
}
