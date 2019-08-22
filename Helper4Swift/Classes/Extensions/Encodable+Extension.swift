//
//  Encodable+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import Foundation

public extension Encodable {
    
    /// Printing the response json on the consol in pretty printed json
    var debugDescription: String {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(self)
            return String(data: jsonData, encoding: String.Encoding.utf8) ?? "nil"
        } catch {
            return "nil"
        }
    }
    
    /// Converting object to postable [String: Any]
    func toDictionary(_ encoder: JSONEncoder = JSONEncoder()) -> [String: Any] {
        guard let data = try? encoder.encode(self) else { return [:] }
        guard let object = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else { return [:] }
        guard let json = object as? [String: Any] else { return [:] }
        return json
    }
    
    /// Converting object to postable array of [[String: Any]]
    func toDictionaryArray(_ encoder: JSONEncoder = JSONEncoder()) -> [[String: Any]] {
        guard let data = try? encoder.encode(self) else { return [[:]] }
        guard let object = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else { return [[:]] }
        guard let jsonArray = object as? [[String: Any]] else { return [[:]] }
        return jsonArray
    }
}
