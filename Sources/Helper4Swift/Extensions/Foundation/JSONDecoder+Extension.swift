//
//  JSONDecoder+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import Foundation

public extension JSONDecoder {
    
    /// Decode a given Decodable object from a given url
    ///
    /// - Parameters:
    ///   - type: Decodable
    ///   - url: URL
    ///   - completion: data
    func decode<T: Decodable>(_ type: T.Type, fromURL url: String, completion: @escaping (T) -> Void) {
        guard let url = URL(string: url) else { fatalError("Invalid URL passed.") }
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                let downloadedData = try self.decode(type, from: data)
                DispatchQueue.main.async { completion(downloadedData) }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
