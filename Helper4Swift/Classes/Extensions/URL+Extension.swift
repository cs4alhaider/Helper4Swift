//
//  URL+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 23/08/2019.
//

import Foundation

public extension URL {
    
    /// Converting regular url into query parameters
    var queryParameters: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
    }
}
