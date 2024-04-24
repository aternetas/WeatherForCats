//
//  SearchViewController.swift
//  WeatherForCats
//
//  Created by f f on 24.04.2024.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var citySearchBar: UISearchBar!
    
    var delegate: SearchViewControllerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        citySearchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        delegate.update(cityForSearching: searchBar.text)
        navigationController?.popViewController(animated: true)
    }
}
