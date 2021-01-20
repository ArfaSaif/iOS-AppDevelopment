//
//  WeatherManager.swift
//  Clima
//
//  Created by Arfa Saif on 2020-05-11.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}
class WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    let Url = "https://api.openweathermap.org/data/2.5/weather?appid=8ed7606109d6389baf907388e50f8f7e&units=metric"
    func lookUpWeather(cityName: String)
    {
        let url = "\(Url)&q=\(cityName)"
        print("Looking up Weather for \(cityName) with url = \(url)")
        performRequest(with: url)
    }
    func lookUpWeather(lat: CLLocationDegrees , lon: CLLocationDegrees)
    {
        let url = "\(Url)&lat=\(lat)&lon=\(lon)"
        print("Looking up Weather for \(lat) with url = \(url)")
        performRequest(with: url)
    }
    func performRequest(with urlString: String)
    {
        print("In perform request")
        if let url = URL(string: urlString){
            print("Set up session")
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil
                {
//                    print(error!)
                    self.delegate?.didFailWithError(error: error!) // unwrap since we know its not nil
                    return
                }
                // no error, data could be nil
                if let safeData = data {
//                    print(String(data: safeData, encoding: .utf8))
                    // got an error saying that parseJSON could return a nil, so use coaleasing operator, instead use IFLET STATEMENT, and that will only do this if this is not null
                    if let weather = self.parseJSON(safeData)
                    {
                        self.delegate?.didUpdateWeather(self, weather: weather) // self is the WeatherManager
                        
                    }
                }
            }
            print("Made a url request")
            
            task.resume()
        }
        // optional binding used in case the url is a string
    }
    func parseJSON(_ weatherData: Data) -> WeatherModel?
    {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData )
            let temp = decodedData.main.temp
            let description = decodedData.weather[0].description
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let weather = WeatherModel(cityName: name, temperature: temp, conditionId: id)
            // want to return this weather object to perform Request, but in the case that there has been an error, return nil. But inorder to return nil, must make the return type an optional
            return weather
            
        }
        catch{
            self.delegate?.didFailWithError(error: error)
//            print(error)
        }
        return nil
    }
  
    
    
    
}
