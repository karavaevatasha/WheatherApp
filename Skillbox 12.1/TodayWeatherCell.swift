//
//  TodayWeatherCell.swift
//  Skillbox 12.1
//
//  Created by Nataliia on 09.07.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import UIKit

class TodayWeatherCell: UITableViewCell {

    @IBOutlet weak var nameTownLabel: UILabel!
    @IBOutlet weak var skyConditionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
