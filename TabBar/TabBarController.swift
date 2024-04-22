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
        guard let viewControllers = viewControllers else { return }
        if let items = tabBar.items {
            items[0].title = viewControllers[0].title
            items[1].title = viewControllers[1].title
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let items = tabBar.items {
            UserDefaults.standard.setValue(items.firstIndex(of: item), forKey: "selectedTabBarIndex")
        }
    }
}
