//
//  WeatherViewCell.swift
//  rainyshinycloudy
//
//  Created by 高游兴 on 5/31/17.
//  Copyright © 2017 young gao. All rights reserved.
//

import UIKit

class WeatherViewCell: UITableViewCell {

    @IBOutlet weak var minTempLbl: UILabel!
    @IBOutlet weak var maxTempLbl: UILabel!
    @IBOutlet weak var weatherTypeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateUI(weatherCell: WeatherCell){
        minTempLbl.text = String(weatherCell.minTemp) + "°F"
        maxTempLbl.text = String(weatherCell.maxTemp) + "°F"
        weatherTypeLbl.text = weatherCell.weatherType
        dateLbl.text = weatherCell.date
        weatherImage.image = weatherCell.weatherImage
    }

}
