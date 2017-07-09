//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by 高游兴 on 6/4/17.
//  Copyright © 2017 young gao. All rights reserved.
//


import UIKit
import Alamofire

class Forecast {
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    
    var date: String{
        if _date == nil {
           _date = ""
        }
        return _date
    }
    var weatherType: String{
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    var highTemp: String{
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    var lowTemp: String{
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    init(weatherDict : Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject>{
            if let min = temp["min"] as? Double{
                let kelvinToFarenheitPreDivision = (min * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision / 10))
                self._lowTemp = "\(kelvinToFarenheit)" // convert double to string
            }
            if let max = temp["max"] as? Double{
                let kelvinToFarenheitPreDivision = (max * (9/5) - 459.67)
                let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision / 10))
                self._highTemp = "\(kelvinToFarenheit)" // convert double to string
            }

        }
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>]{
            if let main = weather[0]["main"] as? String{
                self._weatherType = main
            }
        
        }
        if let date = weatherDict["dt"] as? Double{
            let unixConvertedDate = Date(timeIntervalSince1970: date)  // convert the date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"      // settings
            dateFormatter.dateStyle = .full
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfWeek()
        }
    }

}

extension Date{    // extension to get the week date
    func dayOfWeek() -> String{
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
