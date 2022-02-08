//
//  WeatherManager.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 08.02.2022.
//

import Foundation

struct WeatherManager {
    
    //MARK: - Properties
    
    var delegate: WeatherManagerDelegate?
    
    private let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=79bf3d26d4be3a8cd7d6f5d952bc6d8a&units=metric"
    
    //MARK: - Methods
    
    func fetchWeather(cityName: String) {
        let urlAsString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlAsString)
    }
    
    func performRequest(with stringURL: String) {
        
        guard let url = URL(string: stringURL) else { return }
        print(url)
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            guard let encodedData = self.parseJSON(with: data) else { return }
            print(encodedData)
            self.delegate?.didUpdateWeather(weatherManager: self, weatherModel: encodedData)
            
            guard let error = error else { return }
            delegate?.didFailWithError(error: error)
        }.resume()
    }
    
    private func parseJSON(with weatherData: Data) -> WeatherModel? {
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let name = decodedData.name
            let id = decodedData.weather[0].id
            let feelsLike = decodedData.main.feelsLike
            let description = decodedData.weather[0].description
            let temp = decodedData.main.temp
            
            let weather = WeatherModel(cityName: name ?? "",
                                       temperature: temp,
                                       feelsLike: feelsLike,
                                       description: description ?? "",
                                       id: id)
        
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

protocol WeatherManagerDelegate {
    func didUpdateWeather(weatherManager: WeatherManager, weatherModel: WeatherModel)
    func didFailWithError(error: Error)
}
