//
//  Extension + CoreLocation.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 09.02.2022.
//

import CoreLocation

extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        locationManager.stopUpdatingLocation()
        let lat = location.coordinate.latitude
        let lon = location.coordinate.longitude
        weatherManager.fetchLocation(latitude: lat, longtitude: lon)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        showAlert(with: error)
    }
}
