//
//  DateHelper.swift
//  Skillbox 12.1
//
//  Created by Nataliia on 23.08.2020.
//  Copyright © 2020 Natalia. All rights reserved.
//

import Foundation

final class DateHelper {
    
    static let shared = DateHelper()
    
    typealias convertData = (time: String, date: String)
    
    func convertDate(unix: Double) -> convertData {
        let timeResult = Double(unix)
        let date = NSDate(timeIntervalSince1970: timeResult)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeZone = NSTimeZone() as TimeZone
        let localDate = dateFormatter.string(from: date as Date)
        
        let dateArray = localDate.components(separatedBy: ", ")
        
        return (time: dateArray[1], date: dateArray[0])
    }
}
