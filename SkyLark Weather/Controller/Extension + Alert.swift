//
//  Extension + Alert.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 08.02.2022.
//

import UIKit

extension WeatherViewController {
    
    func showAlert(with error: Error? = nil) {
        
        guard let error = error else { return }
        
        let alert = UIAlertController(title: "Oops!",
                                      message: "Something went wrong: \(error)",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .cancel)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}
