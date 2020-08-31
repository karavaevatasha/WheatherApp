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
