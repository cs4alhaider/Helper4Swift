//
//  URL+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 23/08/2019.
//

import Foundation

// CoreData releated
extension URL {

    /// Creates a store URL for the given app group and database pointing to the sqlite database
    ///
    /// ```
    /// import CoreData
    ///
    /// struct PersistenceController {
    ///     static let shared = PersistenceController()
    ///
    ///     let container: NSPersistentCloudKitContainer
    ///
    ///     init() {
    ///         let storeURL = URL.storeURL(for: "group.com.example.MyApp", databaseName: "MyApp")
    ///         let storeDescription = NSPersistentStoreDescription(url: storeURL)
    ///
    ///         container = NSPersistentCloudKitContainer(name: "MyApp")
    ///         container.persistentStoreDescriptions = [storeDescription]
    ///         container.loadPersistentStores(completionHandler: { (storeDescription, error) in
    ///             if let error = error as NSError? {
    ///                 fatalError("Unresolved error \(error), \(error.userInfo)")
    ///             }
    ///         })
    ///         container.viewContext.automaticallyMergesChangesFromParent = true
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - appGroup: Your app group id like > `"group.com.example.MyApp"`
    ///   - databaseName: Your app database name
    ///
    /// - Returns: URL for the given app group
    static func storeURL(for appGroup: String, databaseName: String) -> URL {
        guard let fileContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroup) else {
            fatalError("Shared file container could not be created.")
        }

        return fileContainer.appendingPathComponent("\(databaseName).sqlite")
    }
}

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

public extension Collection where Element == URLQueryItem {
    /// Directly access the values by going over the query item key
    subscript(_ name: String) -> String? {
        first(where: { $0.name == name })?.value
    }
}

/// Convert a dictionary into an array of query items
public extension Array where Element == URLQueryItem {
    init<T: LosslessStringConvertible>(_ dictionary: [String: T]) {
        self = dictionary.map({ (key, value) -> Element in
            URLQueryItem(name: key, value: String(value))
        })
    }
}

public extension URL {
    
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

public extension String {
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
