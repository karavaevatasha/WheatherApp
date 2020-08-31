//
//  Forecast.swift
//  Skillbox 12.1
//
//  Created by Nataliia on 10.07.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

/* import Foundation

class Forecast: Decodable {

    let date: String
    let maxTemp: Int
    let minTemp: Int
    let icon: String
   
    
    init?(main: NSDictionary, weather: NSDictionary){
        guard
            let date = main["dt"] as? String,
            let maxTemp = main["temp_max"] as? Int,
            let minTemp = main["temp_min"] as? Int,
            let icon = weather["icon"] as? String else { return nil }
        
        self.date = "\(date)"
        self.maxTemp = maxTemp
        self.minTemp = minTemp
        self.icon = icon
       
    }
    /*  static func getArray(from jsonArray: Any) -> [Forecast]? {
               
               guard let jsonArray = jsonArray as? Array<[String: Any]> else { return nil }
        return jsonArray.compactMap { Forecast(data: $0 as NSDictionary) }
               
    }*/
}

 "main":{
 "temp":290.27,
 "feels_like":288.56,
 "temp_min":290.27,
 "temp_max":290.86,
 "pressure":1013,
 "sea_level":1013,
 "grnd_level":997,
 "humidity":74,
 "temp_kf":-0.59
 }
 
 ,"weather":[{  "id":500, "main":
                    "Rain", "description":
                                 "light rain", "icon":"10d"}]
 
 let url = "https://api.openweathermap.org/data/2.5/forecast?q=Moscow,ru&cont=7&appid=04bdf204374f49b99c2ad35658310075"
 
 struct Response: Codable {
 let main: MyMain
 let description: MyDiscription
 
 }
 
 struct Mymain: Codable {
 let temp_min: Double
 let temp_max: Double
 
 }
 
 struct MyDiscription: Codable{
let icon: String
 
 }
 
 
*/
