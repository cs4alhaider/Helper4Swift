//
//  MKCoordinateSpan+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 03/11/2023.
//

import MapKit

public extension MKCoordinateSpan {

    /// Initializes a new MKCoordinateSpan that represents the area covered by the given distance in meters.
    /// - Parameters:
    ///   - distance: The distance in meters for both latitude and longitude spans.
    ///   - center: The center coordinate for the calculation.
    init(distance: CLLocationDistance, center: CLLocationCoordinate2D) {
        let oneDegreeOfLatitudeInMeters: CLLocationDistance = 111_32.0 // Average value in meters
        let latitudeDelta = distance / oneDegreeOfLatitudeInMeters

        let radiansLatitude = center.latitude * .pi / 180.0
        let oneDegreeOfLongitudeInMeters = cos(radiansLatitude) * oneDegreeOfLatitudeInMeters
        let longitudeDelta = distance / oneDegreeOfLongitudeInMeters

        self.init(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
    }
}
