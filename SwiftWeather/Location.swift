//
//  Location.swift
//  SwiftWeather
//
//  Created by CNTT-MAC on 12/29/18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import UIKit
class Location {
    //MARK: Properties
    var weatherLocation: String
    var weatherStatus: String
    var weatherTemperature: String
    
    //MARK: Initialization
    init? (weatherLocation: String, weatherStatus: String, weatherTemperature: String){
        if weatherLocation.isEmpty {
            return nil
        }
        if weatherStatus.isEmpty {
            return nil
        }
        if weatherTemperature.isEmpty {
            return nil
        }
        self.weatherLocation = weatherLocation
        self.weatherStatus = weatherStatus
        self.weatherTemperature = weatherTemperature
    }
}
