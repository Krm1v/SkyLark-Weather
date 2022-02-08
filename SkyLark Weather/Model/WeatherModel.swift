//
//  WeatherModel.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 08.02.2022.
//

import Foundation

struct WeatherModel {
    
    let cityName: String
    let temperature: Double
    let feelsLike: Double
    let description: String
    let id: Int
    
    var feelsLikeString: String {
        return String(format: "%.0f", round(feelsLike))
    }
    
    var temperatureString: String {
        return String(format: "%.0f", round(temperature))
    }
    
    var weatherCondition: String {
        
        switch id {
        case 200...232:
            return "cloud.bolt.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 701...781:
            return "cloud.fog.fill"
        case 800:
            return "sun.max.fill"
        case 801...804:
            return "cloud.bolt.fill"
        default:
            return "cloud.fill"
        }
    }
}

