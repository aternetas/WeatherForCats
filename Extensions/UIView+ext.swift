//
//  UIView+ext.swift
//  WeatherForCats
//
//  Created by f f on 01.04.2024.
//

import UIKit

@IBDesignable
extension UIView {
    
        @IBInspectable
        var topCornersRadius: CGFloat {
            get {
                layer.cornerRadius
            }
    
            set {
                layer.cornerRadius = newValue
                layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }
        }
}
