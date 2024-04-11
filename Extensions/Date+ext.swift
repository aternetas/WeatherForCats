//
//  Date+ext.swift
//  WeatherForCats
//
//  Created by f f on 11.04.2024.
//

import Foundation

fileprivate var hourMinuteFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    return formatter
}()

extension Date {
    func toHourMinute() -> String {
        hourMinuteFormatter.string(from: self)
    }
}
