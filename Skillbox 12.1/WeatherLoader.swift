//
//  WeatherLoader.swift
//  Skillbox 12.1
//
//  Created by Nataliia on 09.07.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import Foundation

protocol WeatherLoaderDelegate{
    func loaded(forecast: Weather)
}

class WeatherLoader{
    var delegate: WeatherLoaderDelegate?
    
    static let shared = WeatherLoader()
    
    func loadWeather(){
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Irkutsk,ru&appid=04bdf204374f49b99c2ad35658310075")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
                let jsonDict = json as? NSDictionary{
                print(type(of: json))
                
                if let weather = Weather(data: jsonDict) {
                    DispatchQueue.main.async {
                        print(weather)
                        self.delegate?.loaded(forecast: weather)
                    }
                }
            }
        }
        task.resume()
    }
}
         
