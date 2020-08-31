//
//  ForecastLoader.swift
//  Skillbox 12.1
//
//  Created by Nataliia on 10.07.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import Foundation
import Alamofire

//protocol CategoriesLoaderDelegate {
//    func loaded(categories: [Forecast])
//}

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
                
//                if let list = response.value,
//                let jsonDict = list as? NSDictionary{
//                DispatchQueue.main.async {
//                    var weekForecast: [Forecast] = []
//
//                    for (_, data) in jsonDict where data is NSDictionary{
//                        if let forecast = Forecast(data: data as! NSDictionary){
//                            weekForecast.append(forecast)
//                        }
//                    }
//                    completion(weekForecast)
                }
            }
        }
    }
}

   /* static func sendRequest(url: String, completion: @escaping (_ forecast: [Forecast])->()) {
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .get).validate().responseJSON { (response) in
            
            switch response.result {
                
            case .success(let value):
           
               var forecast = [Forecast]()
         forecast = Forecast.getArray(from: value)!
                completion(forecast)
                
            case .failure(let error):
                print(error)
            }
        }
    }*/


