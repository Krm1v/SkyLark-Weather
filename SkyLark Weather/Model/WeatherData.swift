//
//  WeatherData.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 08.02.2022.
//

import Foundation

struct WeatherData: Codable {
    
    let name: String?
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    
    let temp: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feelsLike = "feelsLike"
    }
}

struct Weather: Codable {
    
    let id: Int
    let description: String?
}

