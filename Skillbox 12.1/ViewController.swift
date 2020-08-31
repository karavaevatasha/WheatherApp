//
//  ViewController.swift
//  Skillbox 12.1
//
//  Created by Nataliia on 09.07.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var townLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBAction func showWeekWeatherButton(_ sender: Any) {
    }
    
    var forecast: [Weather] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WeatherLoader.shared.delegate = self
        WeatherLoader.shared.loadWeather()
    }
}


extension ViewController: WeatherLoaderDelegate{
    func loaded(forecast weather: Weather) {
        DispatchQueue.main.async {
            self.tempLabel.text = String(format: "%.0f", weather.temp - 273,15) + "°C"
            self.townLabel.text = weather.nameTown
            self.dateLabel.text = DateHelper.shared.convertDate(unix: Double(weather.date) ?? 0).date
            self.feelsLikeLabel.text = "Ощущается как: " + (String(format: "%.0f", weather.feelsLike - 273,15) + "°C")
            self.pressureLabel.text = "Давление: \(Int(weather.pressure) * 3 / 4)мм.р.ст."
            self.humidityLabel.text = "Влажность: \(weather.humidity)%"
        }
    }
}


