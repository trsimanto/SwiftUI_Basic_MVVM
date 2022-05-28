//
//  Models.swift
//  SwiftUI_Basic_MVVM
//
//  Created by Towhid on 5/28/22.
//

import Foundation


// MARK: - Welcome
struct WeatherModel : Codable {
    let timezone: String
    let current: CurrentWeather
}

// MARK: - Current
struct CurrentWeather : Codable {
    let temp : Double
    let weather: [WeatherInfo]
}

// MARK: - Weather
struct WeatherInfo : Codable{
    let main, description : String
}

