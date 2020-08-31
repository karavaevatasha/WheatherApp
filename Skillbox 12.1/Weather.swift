//
//  Weather.swift
//  Skillbox 12.1
//
//  Created by Nataliia on 09.07.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import Foundation

class Weather: Codable {
    
    let nameTown: String
    let date: String
    let temp: Double
    let feelsLike: Double
    let pressure: Double
    let humidity: Double
    
    init?(data: NSDictionary){
        guard
            let nameTown = data["name"] as? String,
            let date = data["dt"] as? Int,
            
             let main = data["main"] as? NSDictionary,
           
            let temp = main["temp"] as? Double,
            let feelsLike = main["feels_like"] as? Double,
            let pressure = main["pressure"] as? Double,
            let humidity = main["humidity"] as? Double else { return nil }
        self.temp = temp
        self.nameTown = nameTown
        self.date = "\(date)"
        self.feelsLike = feelsLike
        self.pressure = pressure
        self.humidity = humidity
    }
}
