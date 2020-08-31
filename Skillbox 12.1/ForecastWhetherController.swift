//
//  ForecastWhetherController.swift
//  Skillbox 12.1
//
//  Created by Nataliia on 09.07.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import UIKit



class ForecastWhetherController: UITableViewController {
    
    
    @IBOutlet var forecastTable: UITableView!
    
        var weekForecast: [WeatherWeek] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.forecastTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AlamofireNetworkRequest().loadAlomafireWeather { weekForecast in
            self.weekForecast = weekForecast
            self.forecastTable.reloadData()
        }
    }
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 1
    //    }
    //
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        return weekForecast.count
    //    }
//}
//extension ForecastWhetherController: UITableViewDataSource{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print (weekForecast.count)
       guard weekForecast.count != 0 else {return 1}
        return weekForecast.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ForecastWeatherCell
        
        if weekForecast.count != 0 {
            let model = weekForecast[indexPath.row]
            print (model)
            let modelIcon = model.weather[0]?.icon
            
            cell.dateLabel.text = model.dt_txt
           //  cell.dateLabel.text = DateHelper.shared.convertDate(unix: Double(weather.date) ?? 0).date
            cell.maxTemp.text = "\(Int(model.main?.temp_max ?? 0))°C"
            cell.minTemp.text = "\(Int(model.main?.temp_min ?? 0))°C"
            cell.iconImage.image = UIImage.init(named: String(modelIcon ?? "L7fMEJejqXI"))
            
        } else {
            cell.dateLabel.text = "Error"
            cell.maxTemp.text = "1-No connecttion"
            cell.minTemp.text = "2-No connecttion"
            
        }
        return cell
    }
}
/* extension ForecastWhetherController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekForecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ForecastWeatherCell
        let weather = weekForecast[indexPath.row]
        cell.dateLabel.text = DateHelper.shared.convertDate(unix: Double(main.date) ?? 0).date
        cell.maxTemp.text = String(format: "%.0f", main.maxTemp - 273,15) + " °C"
        cell.minTemp.text = String(format: "%.0f", main.minTemp - 273,15) + " °C"
       // cell.iconImage.image = "\(week.icon)"
        return cell
    }
}


extension ForecastWeatherCell {
    func loaded(forecast weather: Forecast) {
        DispatchQueue.main.async {
            
            self.dateLabel.text = DateHelper.shared.convertDate(unix: Double(weather.date) ?? 0).date
            self.maxTemp.text = String(format: "%.0f", weather.maxTemp - 273,15) + " °C"
            self.minTemp.text = String(format: "%.0f", weather.minTemp - 273,15) + " °C"
            
            
        }
    }
}*/
