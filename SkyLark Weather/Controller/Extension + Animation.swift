//
//  Extension + Animation.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 09.02.2022.
//

import Spring

extension WeatherViewController {
    
    func animateLocationButton(button: SpringButton) {
        button.autostart = false
        button.duration = 2
        button.delay = 0
        button.animation = "morph"
        button.force = 1
        button.animate()
    }
    
    func animateSearchButton(button: SpringButton) {
        button.autostart = false
        button.duration = 2
        button.delay = 0
        button.animation = "pop"
        button.force = 1
        button.animate()
    }
}
