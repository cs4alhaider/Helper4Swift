//
//  Bundle+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import Foundation

public extension Bundle {
    
    /// Decode an exesting json file
    ///
    /// ```
    /// let model = Bundle.main.decode([Model].self, from: "modelss.json")
    /// ```
    ///
    /// - Parameters:
    ///   - type: Decodable object
    ///   - file: file name or uel
    /// - Returns: decoded object
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in app bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) in app bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from app bundle.")
        }
        return loaded
    }
}


public extension Bundle {
    
    /// Retrieves the `infoDictionary` dictionary inside Bundle and
    /// returns the value accessed with the key `CFBundleName`.
    var appName: String {
        guard let infoDictionary = Bundle.main.infoDictionary else { return "unknown" }
        guard let name = infoDictionary["CFBundleName"] as? String else { return "unknown" }
        return name
    }
    
    /// Retrieves the `infoDictionary` dictionary inside Bundle and
    /// returns the value accessed with the key `CFBundleIdentifier`.
    var bundleIdentifier: String {
        guard let infoDictionary = Bundle.main.infoDictionary else { return "unknown" }
        guard let bundleIdentifier = infoDictionary["CFBundleIdentifier"] as? String else { return "unknown" }
        return bundleIdentifier
    }
    
    /// Retrieves the `infoDictionary` dictionary inside Bundle and
    /// returns the value accessed with the key `CFBundleVersion`.
    var buildNumber: String {
        guard let infoDictionary = Bundle.main.infoDictionary else { return "unknown" }
        guard let buildNumber = infoDictionary["CFBundleVersion"] as? String else { return "unknown" }
        return buildNumber
    }
    
    /// Retrieves the `infoDictionary` dictionary inside Bundle and
    /// returns the value accessed with the key `CFBundleShortVersionString`.
    var versionNumber: String {
        guard let infoDictionary = Bundle.main.infoDictionary else { return "unknown" }
        guard let versionNumber = infoDictionary["CFBundleShortVersionString"] as? String else { return "unknwon" }
        return versionNumber
    }
    
    /// Retrieves the `infoDictionary` dictionary inside Bundle, retrieves
    /// the value accessed with the key `CFBundleShortVersionString` and parses
    /// it to return the version major number.
    ///
    /// - Returns: the version number of the Xcode project as a whole(e.g. 1.0.3)
    var versionMajorNumber: String {
        guard let infoDictionary = Bundle.main.infoDictionary else { return "unknown" }
        guard let versionNumber = infoDictionary["CFBundleShortVersionString"] as? String else { return "unknwon" }
        return versionNumber.components(separatedBy: ".")[0]
    }
    
    /// Retrieves the `infoDictionary` dictionary inside Bundle, retrieves
    /// the value accessed with the key `CFBundleShortVersionString` and parses
    /// it to return the version minor number.
    var versionMinorNumber: String {
        guard let infoDictionary = Bundle.main.infoDictionary else { return "unknown" }
        guard let versionNumber = infoDictionary["CFBundleShortVersionString"] as? String else { return "unknwon" }
        return versionNumber.components(separatedBy: ".")[1]
    }
    
    /// Retrieves the `infoDictionary` dictionary inside Bundle, retrieves
    /// the value accessed with the key `CFBundleShortVersionString` and parses
    /// it to return the version patch number.
    var versionPatchNumber: String {
        guard let infoDictionary = Bundle.main.infoDictionary else { return "unknown" }
        guard let versionNumber = infoDictionary["CFBundleShortVersionString"] as? String else { return "unknwon" }
        return versionNumber.components(separatedBy: ".")[2]
    }
    
    /// Retrieves the `infoDictionary` dictionary inside Bundle, and retrieves
    /// all the values inside it
    var getInfoDictionary: [String: Any] {
        guard let infoDictionary = Bundle.main.infoDictionary else { return [:] }
        return infoDictionary
    }
    
}
