//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchedSomething: UITextField!
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation() // calls didUpdateLocations
        
       
        searchedSomething.delegate = self
        weatherManager.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        print(searchedSomething.text)
        searchedSomething.endEditing(true)
    }
    
    @IBAction func pressHomeLocation(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
}
extension WeatherViewController:UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""
        {
            return true
        }
        else{
            textField.placeholder = "Type Something"
            return false
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchedSomething.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("In textFieldDidEndEditing" )
        if let city = searchedSomething.text{
            weatherManager.lookUpWeather(cityName: city)
        }
        print("Clearing" )
        searchedSomething.text = ""
    }
    
}

extension WeatherViewController: WeatherManagerDelegate {
    
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        locationManager.stopUpdatingLocation()
        print(weather.temperatureString)
        DispatchQueue.main.async {  // a closure
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.weatherCondition)
            self.cityLabel.text = weather.cityName
            
        }
        
    }
    func didFailWithError(error: Error){
        print(error)
    }
    
}

//Mark: -<#Location Manager>


extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        print("Got Location")
        if let location = locations.last {  // take the last one from the array of CLLocation array
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.lookUpWeather(lat: lat, lon: lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("hi")
    }
    
    
    
}
