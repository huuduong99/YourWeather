//
//  WeatherData.swift
//  YourWeather
//
//  Created by duongnh on 03/02/2023.
//

import Foundation

struct WeatherData: Codable {
    let main: Main
    let weather: [Weather]
    let name: String
}

