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

extension Collection where Element == URLQueryItem {
    /// Directly access the values by going over the query item key
    subscript(_ name: String) -> String? {
        first(where: { $0.name == name })?.value
    }
}

/// Convert a dictionary into an array of query items
extension Array where Element == URLQueryItem {
    init<T: LosslessStringConvertible>(_ dictionary: [String: T]) {
        self = dictionary.map({ (key, value) -> Element in
            URLQueryItem(name: key, value: String(value))
        })
    }
}

extension URL {
    
    /// Initializing a URL from a `StaticString` which is known at compile time.
    ///
    /// - Disclaimer:
    /// This uses a StaticString
    ///
    /// - Parameter string: URL
    init(_ string: StaticString) {
        self.init(string: "\(string)")!
    }
    
    subscript(_ name: String) -> String? {
        let urlComponents = URLComponents(string: self.absoluteString)
        let queryItems = urlComponents?.queryItems
        return queryItems?[name]
    }
    
    func addingURLQueryParameters(_ params: [String: String]) -> URL {
        guard var urlComponents = URLComponents(string: self.absoluteString) else { return self }
        urlComponents.queryItems = .init(params)
        return urlComponents.url ?? self
    }
}

extension String {
    subscript(_ name: String) -> String? {
        guard let url = URL(string: self) else { return nil }
        let urlComponents = URLComponents(string: url.absoluteString)
        let queryItems = urlComponents?.queryItems
        return queryItems?[name]
    }
    
    func addingURLQueryParameters(_ params: [String: String]) -> String {
        guard var urlComponents = URLComponents(string: self) else { return self }
        urlComponents.queryItems = .init(params)
        return urlComponents.string ?? self
    }
}
