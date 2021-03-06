//
//  Weather.swift
//  JSON
//
//  Created by Brian Advent on 11.05.17.
//  Copyright © 2017 Brian Advent. All rights reserved.
//

import Foundation
import CoreLocation
let APIKEY = "b6cd08608cf125bafc4ee30f1cca5b66"

struct Weather {
    let summary:String
    let icon:String
    let temperature:Double
    let windSpeed:Double // Sức gió
    let humidity:Double // Độ ẩm
    let time:Double
    
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    
    init(json:[String:Any]) throws {
        guard let summary = json["summary"] as? String else {throw SerializationError.missing("summary is missing")}
        
        guard let icon = json["icon"] as? String else {throw SerializationError.missing("icon is missing")}
        
        guard let temperature = json["temperatureMax"] as? Double else {throw SerializationError.missing("temp is missing")}
        
        guard let windSpeed = json["windSpeed"] as? Double else {throw SerializationError.missing("windSpeed is missing")}
        
        guard let humidity = json["humidity"] as? Double else {throw SerializationError.missing("humidity is missing")}
        
        guard let time = json["time"] as? Double else {throw SerializationError.missing("time is missing")}
        
        self.summary = summary
        self.icon = icon
        self.temperature = temperature
        self.windSpeed = windSpeed
        self.humidity = humidity
        self.time = time
    }
    
    
    static let basePath = "https://api.darksky.net/forecast/\(APIKEY)/"
    
    static func forecast (withLocation location:CLLocationCoordinate2D, completion: @escaping ([Weather]?) -> ()) {
        
        let url = basePath + "\(location.latitude),\(location.longitude)"
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            var forecastArray:[Weather] = []
            
            if let data = data {
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let dailyForecasts = json["daily"] as? [String:Any] {
                            if let dailyData = dailyForecasts["data"] as? [[String:Any]] {
                                var i = 0;
                                for dataPoint in dailyData {
                                    if let weatherObject = try? Weather(json: dataPoint) {
                                        i += 1
                                        print(i)
                                        print(dataPoint)
                                        forecastArray.append(weatherObject)
                                    } else {
                                        print("can not fill data")
                                    }
                                }
                            }
                        }
                    
                    }
                }catch {
                    print(error.localizedDescription)
                }
                
                completion(forecastArray)
            }
        }
        
        task.resume()
        
    }
}
