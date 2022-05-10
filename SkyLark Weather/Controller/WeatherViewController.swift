//
//  ViewController.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 24.07.2021.
//

import UIKit
import CoreLocation
import Spring

class WeatherViewController: UIViewController {
    
    //MARK: - @IBOutlets
    
    @IBOutlet weak var searchTextField: SpringTextField!
    @IBOutlet weak var weatherStatusImage: UIImageView!
    @IBOutlet weak var weatherConditionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var locationButton: SpringButton!
    @IBOutlet weak var searchButton: SpringButton!
    
    //MARK: - Properties
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    //MARK: - UIView lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestureForContainerView(view)
        searchTextField.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    //MARK: - @IBActions
    
    @IBAction func searchButtonPressed() {
        animateSearchButton(button: searchButton)
        searchTextField.endEditing(true)
    }
    
    @IBAction func myLocationButtonPressed() {
        animateLocationButton(button: locationButton)
        locationManager.requestLocation()
    }
}

