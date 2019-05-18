//
//  Encodable+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import Foundation

/// JSON == [String: Any]
///
/// - Author: Abdullah Alhaider
public typealias JSON = [String: Any]

public extension Encodable {
    
    /// Printing the response json on the consol in pretty printed json
    ///
    /// - Author: Abdullah Alhaider
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
    
    /// Converting object to postable JSON
    ///
    /// - Author: Abdullah Alhaider
    func toDictionary(_ encoder: JSONEncoder = JSONEncoder()) -> JSON {
        guard let data = try? encoder.encode(self) else { return [:] }
        guard let object = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else { return [:] }
        guard let json = object as? JSON else { return [:] }
        return json
    }
    
    /// Converting object to postable array of JSON
    ///
    /// - Author: Abdullah Alhaider
    func toDictionaryArray(_ encoder: JSONEncoder = JSONEncoder()) -> [JSON] {
        guard let data = try? encoder.encode(self) else { return [[:]] }
        guard let object = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else { return [[:]] }
        guard let jsonArray = object as? [JSON] else { return [[:]] }
        return jsonArray
    }
}
