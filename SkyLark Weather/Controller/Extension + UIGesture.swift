//
//  Extension + UIGesture.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 09.02.2022.
//

import UIKit

extension WeatherViewController {
    
    func addTapGestureForContainerView(_ view: UIView) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapContainer))
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.isEnabled = true
        tapGestureRecognizer.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func tapContainer() {
        self.searchTextField.endEditing(true)
        self.view.endEditing(true)
    }
}
