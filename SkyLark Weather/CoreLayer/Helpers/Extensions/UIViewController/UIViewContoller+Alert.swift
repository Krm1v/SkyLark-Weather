//
//  Extension + Alert.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 08.02.2022.
//

import UIKit

extension UIViewController {
    
    func showAlert(with error: String? = nil) {
        
        guard let error = error else { return }
        let stringError = String(error)
        
        let alert = UIAlertController(title: "Oops!",
                                      message: "Something went wrong: \(stringError)",
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .cancel)
        
        alert.addAction(action)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
