//
//  CLLocationCoordinate2D+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 04/02/2022.
//

import CoreLocation

public extension CLLocationCoordinate2D {
    static func coordinate(latitude: Double, longitude: Double) -> CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
