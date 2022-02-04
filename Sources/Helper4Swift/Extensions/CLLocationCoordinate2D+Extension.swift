//
//  CLLocationCoordinate2D+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 04/02/2022.
//

import MapKit

public extension CLLocationCoordinate2D {
    static func coordinate(latitude: Double, longitude: Double) -> CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}
