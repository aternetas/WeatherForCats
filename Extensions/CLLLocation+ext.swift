//
//  CLLLocation+ext.swift
//  WeatherForCats
//
//  Created by f f on 13.05.2024.
//

import Foundation
import CoreLocation

fileprivate var geocoder = CLGeocoder()

extension CLLocation {
    
    func convertToCityName(completionHandler: @escaping (String) -> Void) {
        geocoder.reverseGeocodeLocation(self) { placemarks, error in
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            guard let locality = placemarks?.first?.locality else { return }
            completionHandler(locality)
        }
    }
}
