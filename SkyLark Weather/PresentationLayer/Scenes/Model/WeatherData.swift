//
//  WeatherData.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 08.02.2022.
//

import Foundation

struct WeatherData: Decodable {
	let name: String?
	let main: Main
	let weather: [Weather]
}

struct Main: Decodable {
	let temp: Double
	let feelsLike: Double
}

struct Weather: Decodable {
	let id: Int
	let description: String?
}

