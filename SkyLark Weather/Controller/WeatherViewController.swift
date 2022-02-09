//
//  ViewController.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 24.07.2021.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    //MARK: - @IBOutlets
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var weatherStatusImage: UIImageView!
    @IBOutlet weak var weatherConditionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    //MARK: - Properties
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    //MARK: - UIView lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    //MARK: - @IBActions
    
    @IBAction func searchButtonPressed() {
        searchTextField.endEditing(true)
    }
    
    @IBAction func myLocationButtonPressed() {
        locationManager.requestLocation()
    }
}

