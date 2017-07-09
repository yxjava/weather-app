//
//  WeatherCell.swift
//  rainyshinycloudy
//
//  Created by 高游兴 on 5/31/17.
//  Copyright © 2017 young gao. All rights reserved.
//
import UIKit
import Foundation
class WeatherCell{
    private var _minTemp: String!
    private var _maxTemp: String!
    private var _weatherType: String!
    private var _weatherImage: UIImage!
    private var _date: String!
    
    var minTemp: String{
        return _minTemp
    }
    var maxTemp: String{
        return _maxTemp
    }
    var weatherType: String{
        return _weatherType
    }
    var weatherImage: UIImage{
        return _weatherImage
    }
    var date: String{
        return _date
    }
    
    
    init(minTemp: String, maxTemp: String, weatherType: String, weatherImage: UIImage, date: String) {
        _minTemp = minTemp
        _maxTemp = maxTemp
        _weatherType = weatherType
        _weatherImage = weatherImage
        _date = date
    }
    
    
}
