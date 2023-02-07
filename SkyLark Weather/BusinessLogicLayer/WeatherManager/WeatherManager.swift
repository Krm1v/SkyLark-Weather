//
//  WeatherManager.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 08.02.2022.
//

import Foundation
import CoreLocation

fileprivate enum BaseURLs {
	static let baseURL = "https://api.openweathermap.org/data/2.5/weather?appid=79bf3d26d4be3a8cd7d6f5d952bc6d8a&units=metric"
}

protocol WeatherManagerDelegate {
	func didUpdateWeather(weatherManager: WeatherManager,
						  weatherModel: WeatherModel)
	func didFailWithError(error: Error)
}

struct WeatherManager {
	//MARK: - Properties
	var delegate: WeatherManagerDelegate?
	
	//MARK: - Public methods
	func fetchWeather(cityName: String) {
		let urlAsString = "\(BaseURLs.baseURL)&q=\(cityName)"
		performRequest(with: urlAsString)
	}
	
	func fetchLocation(latitude: CLLocationDegrees,
					   longtitude: CLLocationDegrees) {
		let urlAsString = "\(BaseURLs.baseURL)&lat=\(latitude)&lon=\(longtitude)"
		performRequest(with: urlAsString)
	}
}
    
//MARK: - Private extension
private extension WeatherManager {
	func performRequest(with stringURL: String) {
        guard let url = URL(string: stringURL) else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            if let weather = self.parseJSON(with: data) {
                print(weather)
                self.delegate?.didUpdateWeather(weatherManager: self, weatherModel: weather)
            }
            guard let error = error else { return }
            delegate?.didFailWithError(error: error)
        }.resume()
    }
    
    private func parseJSON(with weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let name = decodedData.name ?? "No data"
            let id = decodedData.weather[0].id
            let feelsLike = decodedData.main.feelsLike
            let description = decodedData.weather[0].description ?? "No data"
            let temp = decodedData.main.temp
            let weather = WeatherModel(cityName: name,
                                       temperature: temp,
                                       feelsLike: feelsLike,
                                       description: description,
                                       id: id)
            return weather
        } catch let error {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
