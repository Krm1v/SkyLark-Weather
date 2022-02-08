//
//  Extension + Alert.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 08.02.2022.
//

import UIKit

extension WeatherViewController {
    
    func showAlert() {
        
        let alert = UIAlertController(title: "Wrong format",
                                      message: "Enter correct data",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .cancel)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}
