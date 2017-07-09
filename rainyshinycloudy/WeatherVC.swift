//
//  Weather.swift
//  rainyshinycloudy
//
//  Created by 高游兴 on 5/30/17.
//  Copyright © 2017 young gao. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var weatherBKGIMG: UIImageView!
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    var weatherCells = [WeatherCell]()
    var currentWeather = CurrentWeather()
   
    var forecasts = [Forecast]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         locationAuthStatus()
    }
    func locationAuthStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
                currentLocation = locationManager.location
                Location.sharedInstance.latitude = currentLocation.coordinate.latitude
                Location.sharedInstance.longitude = currentLocation.coordinate.longitude
                currentWeather.downloadWeatherDetails{
                self.downloadForecastData {
                    self.updateUI()
                   }
                    self.tableView.dataSource = self
                    self.tableView.delegate = self
            }
        }else{
              locationManager.requestWhenInUseAuthorization()
               locationAuthStatus()
        }
    
    }
    func downloadForecastData(completed: @escaping DownloadComplete){
        let forecastWeatherURL = URL(string: FORECAST_WEATHER_URL)!
        Alamofire.request(forecastWeatherURL).responseJSON {
            response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        
                            let p = WeatherCell(minTemp: forecast.lowTemp, maxTemp: forecast.highTemp, weatherType: forecast.weatherType, weatherImage: UIImage(named: forecast.weatherType)!, date: forecast.date)
                            self.weatherCells.append(p)
                        

                       
                    }
                    
                }

            }
            
            completed()
        }
    
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherCells.count
        
    }
    func updateUI(){
        locationLbl.text = currentWeather.cityName
        tempLbl.text = "\(currentWeather.currentTemp)°F"
        dateLbl.text = currentWeather.date
        weatherBKGIMG.image = UIImage(named: currentWeather._weatherType)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath ) as? WeatherViewCell{
            let _weatherCell = weatherCells[indexPath.row]
            cell.updateUI(weatherCell: _weatherCell)
            return cell
        }else {
            return UITableViewCell()
        }
    }
}

