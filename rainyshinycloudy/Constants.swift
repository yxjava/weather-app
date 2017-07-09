//
//  Constants.swift
//  rainyshinycloudy
//
//  Created by 高游兴 on 6/3/17.
//  Copyright © 2017 young gao. All rights reserved.
//

import Foundation
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "b51d1884c9045eed72558d83b2af01d9"
let BASE_URL_FORECAST = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let CNT = "&cnt"
typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=b51d1884c9045eed72558d83b2af01d9"
let FORECAST_WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt7&appid=b51d1884c9045eed72558d83b2af01d9"
