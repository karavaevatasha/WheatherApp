//
//  ForecastLoader.swift
//  Skillbox 12.1
//
//  Created by Nataliia on 10.07.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import Foundation
import Alamofire

struct Request: Decodable {
    var list : [WeatherWeek?]
}

struct WeatherWeek: Decodable {
    var main : Temperature?
    var dt_txt : String?
    var weather : [IconStatus?]
}

struct Temperature: Decodable {
    var temp_min : Float?
    var temp_max : Float?
}

struct IconStatus: Decodable {
    var icon : String?
}

class AlamofireNetworkRequest {

    
   func loadAlomafireWeather(callback: @escaping ([WeatherWeek])->()){
    
    AF.request("https://api.openweathermap.org/data/2.5/forecast?q=Irkutsk,ru&appid=04bdf204374f49b99c2ad35658310075&units=metric"
        , method: .get).responseJSON { response in
            
            if let data = response.data {
            do {
                let cityWether = try JSONDecoder().decode(Request.self, from: data)
                var weekForecast: [WeatherWeek] = []
                cityWether.list.forEach { weather in
                    if let weather = weather {
                        weekForecast.append(weather)
                    }
                }
                callback(weekForecast)
            } catch let error {
                print(error)
                }
            }
        }
    }
}
