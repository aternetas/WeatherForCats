//
//  TabBarController.swift
//  WeatherForCats
//
//  Created by f f on 22.04.2024.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        tabBar.tintColor = UIColor(resource: .textColor2)
        tabBar.unselectedItemTintColor = .darkGray
        
        if let items = tabBar.items {
            items[0].image = UIImage(systemName: "cloud")?.withBaselineOffset(fromBottom: 15.0)
            items[1].image = UIImage(systemName: "magnifyingglass")?.withBaselineOffset(fromBottom: 15.0)
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let items = tabBar.items {
            UserDefaults.standard.setValue(items.firstIndex(of: item), forKey: "selectedTabBarIndex")
        }
    }
}
