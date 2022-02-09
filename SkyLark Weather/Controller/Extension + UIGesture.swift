//
//  Extension + UIGesture.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 09.02.2022.
//

import UIKit

extension WeatherViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
