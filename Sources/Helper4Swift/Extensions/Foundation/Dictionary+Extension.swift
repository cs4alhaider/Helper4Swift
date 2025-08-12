//
//  Dictionary+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import Foundation

public extension Dictionary {
    
    /// Converting the dictionary to string
    var json: String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? "Not a valid JSON"
        } catch {
            return "Not a valid JSON"
        }
    }
    
    /// Updates the value stored in the dictionary for the given key, or
    /// adds a new key-value pair if the key does not exist.
    ///
    /// ```
    /// var names = ["Abdullah": "Tariq", "Ali": "Abdullah"]
    /// var newNames = ["Ahmed": "Abdulaziz", "M": "Sara"]
    /// names.update(with: newNames)
    /// print(names) // ["Ahmed": "Abdulaziz", "Abdullah": "Tariq", "M": "Sara", "Ali": "Abdullah"]
    /// ```
    ///
    /// - Parameter newDictionary: The new dictionary you want to add it to the old dictionary
    mutating func update(with newDictionary: Dictionary) {
        newDictionary.forEach({self.updateValue($1, forKey: $0)})
    }
    
    /// JSON Data from dictionary.
    ///
    /// - Parameter prettify: set true to prettify data (default is false).
    /// - Returns: optional JSON Data (if applicable).
    func jsonData(prettify: Bool = false) -> Data? {
        guard JSONSerialization.isValidJSONObject(self) else {
            return nil
        }
        let options = (prettify == true) ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions()
        return try? JSONSerialization.data(withJSONObject: self, options: options)
    }
}

public extension Dictionary where Value: Equatable {
    
    /// Returns an array of all keys that have the given value in dictionary.
    ///
    ///        let dict = ["key1": "value1", "key2": "value1", "key3": "value2"]
    ///        dict.keys(forValue: "value1") -> ["key1", "key2"]
    ///        dict.keys(forValue: "value2") -> ["key3"]
    ///        dict.keys(forValue: "value3") -> []
    ///
    /// - Parameter value: Value for which keys are to be fetched.
    /// - Returns: An array containing keys that have the given value.
    func keys(forValue value: Value) -> [Key] {
        return keys.filter { self[$0] == value }
    }
}

public extension Dictionary where Key == String, Value == Any {
    
    /// Appinding a dictionary of type [String: Any] to another dictionary with same type
    ///
    /// ```
    /// var names: [String: Any] = ["Abdullah": true, "Ali": 1]
    /// var newNames = ["Ahmed": "Abdulaziz", "M": "Sara"]
    /// names+=newNames
    /// print(names) // ["Ali": 1, "Ahmed": "Abdulaziz", "Abdullah": true, "M": "Sara"]
    /// ```
    static func += (lhs: inout [String: Any], rhs: [String: Any]) {
        rhs.forEach({ lhs[$0] = $1})
    }
}

public extension Dictionary where Key == String, Value == String {
    
    /// Appinding a dictionary of [String: String] to another dictionary with same type
    ///
    /// ```
    /// var names = ["Abdullah": "Tariq", "Ali": "Abdullah"]
    /// var newNames = ["Ahmed": "Abdulaziz", "M": "Layan"]
    /// names+=newNames
    /// print(names) // ["Ahmed": "Abdulaziz", "Abdullah": "Tariq", "M": "Sara", "Ali": "Abdullah"]
    /// ```
    static func += (lhs: inout [String: String], rhs: [String: String]) {
        rhs.forEach({ lhs[$0] = $1})
    }
}

// Generic function
//
// func +=<U,T>(lhs: inout [U:T], rhs: [U:T]) {
//     rhs.forEach({ lhs[$0] = $1 })
// }
