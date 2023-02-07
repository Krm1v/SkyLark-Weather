//
//  ViewController.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 24.07.2021.
//

import UIKit
import CoreLocation
import Spring

fileprivate enum Constants {
	static let warningAlertMessage = "Enter correct city name"
}

final class WeatherViewController: UIViewController {
    //MARK: - @IBOutlets
    @IBOutlet private weak var searchTextField: SpringTextField!
    @IBOutlet private weak var weatherStatusImage: UIImageView!
    @IBOutlet private weak var weatherConditionLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var feelsLikeLabel: UILabel!
    @IBOutlet private weak var locationButton: SpringButton!
    @IBOutlet private weak var searchButton: SpringButton!
    
    //MARK: - Properties
    private var weatherManager = WeatherManager()
    private let locationManager = CLLocationManager()
    
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
    @IBAction private func searchButtonPressed() {
        animateSearchButton(button: searchButton)
        searchTextField.endEditing(true)
    }
    
    @IBAction private func myLocationButtonPressed() {
        animateLocationButton(button: locationButton)
        locationManager.requestLocation()
    }
}

//MARK: - Extension + UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		searchTextField.resignFirstResponder()
		return true
	}
	
	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
		guard let text = searchTextField.text, !text.isEmpty else {
			tapContainer()
			showAlert(with: Constants.warningAlertMessage)
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

//MARK: - Extension + WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate {
	func didUpdateWeather(weatherManager: WeatherManager, weatherModel: WeatherModel) {
		DispatchQueue.main.async { [weak self] in
			guard let self = self else { return }
			self.cityLabel.text = weatherModel.cityName
			self.temperatureLabel.text = weatherModel.temperatureString
			self.weatherStatusImage.image = UIImage(systemName: weatherModel.weatherCondition)
			self.weatherConditionLabel.text = weatherModel.description.capitalizingFirstLetter()
			self.feelsLikeLabel.text = "Feels like: \(weatherModel.feelsLikeString)"
		}
	}
	
	func didFailWithError(error: Error) {
		showAlert(with: error.localizedDescription)
	}
}

//MARK: - Extension + CLLocationManagerDelegate
extension WeatherViewController: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager,
						 didUpdateLocations locations: [CLLocation]) {
		guard let location = locations.last else { return }
		locationManager.stopUpdatingLocation()
		let lat = location.coordinate.latitude
		let lon = location.coordinate.longitude
		weatherManager.fetchLocation(latitude: lat, longtitude: lon)
	}
	
	func locationManager(_ manager: CLLocationManager,
						 didFailWithError error: Error) {
		print(error.localizedDescription)
	}
}

//MARK: - Private extension
private extension WeatherViewController {
	func addTapGestureForContainerView(_ view: UIView) {
		let tapGestureRecognizer = UITapGestureRecognizer(target: self,
														  action: #selector(tapContainer))
		tapGestureRecognizer.numberOfTapsRequired = 1
		tapGestureRecognizer.isEnabled = true
		tapGestureRecognizer.cancelsTouchesInView = false
		
		view.addGestureRecognizer(tapGestureRecognizer)
	}
	
	@objc
	private func tapContainer() {
		self.searchTextField.endEditing(true)
		self.view.endEditing(true)
	}
}
