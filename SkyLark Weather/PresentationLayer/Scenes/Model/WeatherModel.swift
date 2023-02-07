//
//  WeatherModel.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 08.02.2022.
//

import Foundation

struct WeatherModel {
    //MARK: - Properties
    let cityName: String
    let temperature: Double
    let feelsLike: Double
    let description: String
    let id: Int
	//MARK: - Computed properties
    var feelsLikeString: String {
        return String(format: "%.0f", round(feelsLike))
    }
    var temperatureString: String {
        return String(format: "%.0f", round(temperature))
    }
    var weatherCondition: String {
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}

