//
//  Extension + UITextFieldDelegate.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 08.02.2022.
//

import Spring

extension WeatherViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        guard let text = searchTextField.text, !text.isEmpty else {
            tapContainer()
            showAlert(with: "Enter correct city name")
            searchTextField.resignFirstResponder()
            return true
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let city = searchTextField.text else { return }
        weatherManager.fetchWeather(cityName: city)
        textField.text = nil
    }
}
