//
//  SearchViewController.swift
//  WeatherForCats
//
//  Created by f f on 22.04.2024.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUi()
    }
    
    private func setupUi() {
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
}
