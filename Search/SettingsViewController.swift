//
//  SearchViewController.swift
//  WeatherForCats
//
//  Created by f f on 22.04.2024.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var noSavedCitiesLabel: UILabel!
    
    var cityService: CityServiceProtocol?
    
    private var cityForSearching: String?
    private var savedCities: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedCities = cityService?.getCities() ?? []
        setupUi()
        searchTextField.delegate = self
    }
    
    private func setupUi() {
        noSavedCitiesLabel.isHidden = !savedCities.isEmpty
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17),
            .foregroundColor: UIColor(resource: .textColor2)
        ]
        searchTextField.attributedPlaceholder = NSAttributedString(string: "Какой город?", attributes: placeholderAttributes)
        
        let searchIconView = UIImageView(frame: CGRect(x: 7.5, y: 4.5, width: 20, height: 20))
        searchIconView.image = UIImage(systemName: "magnifyingglass")
        let searchIconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 27, height: 27))
        searchIconContainerView.addSubview(searchIconView)
        searchTextField.leftView = searchIconContainerView
        searchTextField.leftViewMode = .always
    }
    
    //MARK: -UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityForSearching = textField.text
        textField.resignFirstResponder()
        return true
    }
}
