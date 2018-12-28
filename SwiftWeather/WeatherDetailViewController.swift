//
//  WeatherDetailViewController.swift
//  SwiftWeather
//
//  Created by CNTT-MAC on 12/28/18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherDetailViewController:
    UIViewController,
    UINavigationControllerDelegate
{
    // MARK: properties
    var forecastData = [Weather]()
    
    @IBOutlet weak var lblLocationName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var ivwState: UIImageView!
    @IBOutlet weak var lblTemperature: UILabel!
    
    
    @IBOutlet weak var lblWindSpeed: UILabel!
    @IBOutlet weak var lblHumility: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var location: String = "Ho Chi Minh city"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateWeatherForLocation(location: location)
        
        
    }
    
    func loadData() {
        
        let weatherObject = forecastData[0]
        
        //print(forecastData)
        
        lblDescription.text = weatherObject.summary
        lblTemperature.text = "\(convertFahrenheitToCelsius(fah: Int(weatherObject.temperature))) °C"
        ivwState.image = UIImage(named: weatherObject.icon)
        lblWindSpeed.text = "\(weatherObject.windSpeed) km/h"
        lblHumility.text = "\(weatherObject.humidity * 100)%"
        let date = NSDate(timeIntervalSince1970: weatherObject.time)
        lblDate.text = "\(date)"
    }
    
    func convertFahrenheitToCelsius(fah: Int) ->Int {
        return (fah - 32) * 5/9
    }
    
    
    func updateWeatherForLocation (location:String) {
        CLGeocoder().geocodeAddressString(location) {
            (placemarks:[CLPlacemark]?, error:Error?) in
            if error == nil {
                if let location = placemarks?.first?.location {
                    Weather.forecast(withLocation: location.coordinate, completion: { (results:[Weather]?) in
                        if let weatherData = results {
                            self.forecastData = weatherData
                            
                            DispatchQueue.main.async {
                                //self.tableView.reloadData()
                                self.loadData()
                            }
                        }
                    })
                }
            }
        }
    }

    
}
