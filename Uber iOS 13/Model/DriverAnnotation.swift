//
//  DriverAnnotation.swift
//  Uber iOS 13
//
//  Created by Stanley Traub on 8/13/20.
//  Copyright © 2020 Stanley Traub. All rights reserved.
//

import MapKit

class DriverAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var uid: String
    
    init(uid: String, coordinate: CLLocationCoordinate2D) {
        self.uid = uid
        self.coordinate = coordinate
    }
    
}
