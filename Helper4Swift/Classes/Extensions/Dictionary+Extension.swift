//
//  Dictionary+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import Foundation

public extension Dictionary {
    
    /// Converting the dictionary to string
    ///
    /// - Author: Abdullah Alhaider
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
    ///
    /// - Author: Abdullah Alhaider
    mutating func update(with newDictionary: Dictionary) {
        newDictionary.forEach({self.updateValue($1, forKey: $0)})
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
    ///
    /// - Author: Abdullah Alhaider
    static func += (lhs: inout [String: Any], rhs: [String: Any]) {
        rhs.forEach({ lhs[$0] = $1})
    }
}

extension Dictionary where Key == String, Value == String {
    
    /// Appinding a dictionary of [String: String] to another dictionary with same type
    ///
    /// ```
    /// var names = ["Abdullah": "Tariq", "Ali": "Abdullah"]
    /// var newNames = ["Ahmed": "Abdulaziz", "M": "Layan"]
    /// names+=newNames
    /// print(names) // ["Ahmed": "Abdulaziz", "Abdullah": "Tariq", "M": "Sara", "Ali": "Abdullah"]
    /// ```
    ///
    /// - Author: Abdullah Alhaider
    static func += (lhs: inout [String: String], rhs: [String: String]) {
        rhs.forEach({ lhs[$0] = $1})
    }
}

// Generic function
//
// func +=<U,T>(lhs: inout [U:T], rhs: [U:T]) {
//     rhs.forEach({ lhs[$0] = $1 })
// }
