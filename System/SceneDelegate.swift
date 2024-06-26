//
//  SceneDelegate.swift
//  WeatherForCats
//
//  Created by f f on 28.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let mainStoryboard = UIStoryboard(name: "Main", bundle: .main)
            let settingsStoryboard = UIStoryboard(name: "Settings", bundle: .main)

            let initialViewController = mainStoryboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
            let mainViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            let settingsViewController = settingsStoryboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            
//            let weatherRepository = WeatherRepository()
//            mainViewController.weatherService = WeatherService(weatherRepository: weatherRepository)
            mainViewController.weatherService = WeatherServiceMock()
            
            let mainNavigationController = UINavigationController(rootViewController: mainViewController)
            mainNavigationController.isNavigationBarHidden = true
            
            let cityService = CityService()
            mainViewController.cityService = cityService
            settingsViewController.cityService = cityService
            
//            UserDefaults.standard.setValue([], forKey: "favouriteCities")
            
            initialViewController.setViewControllers([mainNavigationController, settingsViewController], animated: false)
            
            window.rootViewController = initialViewController
            self.window = window
            window.makeKeyAndVisible()
        }
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

