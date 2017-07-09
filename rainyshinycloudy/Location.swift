//
//  Location.swift
//  rainyshinycloudy
//
//  Created by 高游兴 on 7/7/17.
//  Copyright © 2017 young gao. All rights reserved.
//

import Foundation
class Location{
    static var sharedInstance = Location()
    private init(){}
       
    var latitude: Double!
    var longitude: Double!
    
}
