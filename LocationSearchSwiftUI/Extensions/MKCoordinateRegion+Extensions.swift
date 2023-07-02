//
//  MKCoordinateRegion+Extensions.swift
//  LocationSearchSwiftUI
//
//  Created by 沈清昊 on 7/2/23.
//

import Foundation
import MapKit

extension MKCoordinateRegion{
    static func defaultRegion() -> MKCoordinateRegion{
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.33233141, longitude: -122.03121868), span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025))
    }
    
    static func regionFromLandmark(_ landmark: Landmark) -> MKCoordinateRegion {
        MKCoordinateRegion(center: landmark.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025))
    }
}
