//
//  Landmark.swift
//  LocationSearchSwiftUI
//
//  Created by 沈清昊 on 7/2/23.
//

import Foundation
import MapKit

struct Landmark: Identifiable, Hashable{
    let placemark: MKPlacemark
    
    let id = UUID()
    
    var name: String{
        self.placemark.name ?? ""
    }
    
    var title: String{
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D{
        self.placemark.coordinate
    }
}
