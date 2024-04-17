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

fileprivate var dayOfTheWeekFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ru_RU")
    formatter.dateFormat = "E"
    return formatter
}()

extension Date {
    func toHourMinute() -> String {
        hourMinuteFormatter.string(from: self)
    }
    func toDayOfTheWeek() -> String {
        dayOfTheWeekFormatter.string(from: self)
    }
}
