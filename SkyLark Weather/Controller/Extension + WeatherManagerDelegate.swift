//
//  Extension + WeatherManagerDelegate.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 08.02.2022.
//

import UIKit

extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(weatherManager: WeatherManager, weatherModel: WeatherModel) {
        
        DispatchQueue.main.async {
            self.cityLabel.text = weatherModel.cityName
            self.temperatureLabel.text = weatherModel.temperatureString
            self.weatherStatusImage.image = UIImage(systemName: weatherModel.weatherCondition)
            self.weatherConditionLabel.text = weatherModel.weatherCondition
            self.feelsLikeLabel.text = weatherModel.feelsLikeString
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
