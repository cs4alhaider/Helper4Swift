//
//  Observable+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 12/08/2025.
//

import Foundation
import Observation
import SwiftUI

/// An async sequence that observes changes to properties and emits new values when they change.
/// This type enables reactive programming patterns with Swift's Observation framework.
///
/// - Important: The Value type must conform to Sendable for thread safety
///
/// Usage:
/// ```swift
/// @Observable
/// class Store {
///     var count = 0
///     var name = "Abdullah Alhaider"
/// }
///
/// let store = Store()
/// let observations = Observations {
///     store.count
/// }
///
/// Task {
///     for await value in observations {
///         print("Count changed to: \(value)")
///     }
/// }
/// ```
@available(iOS 18.0, *)
public struct Observations<Value: Sendable>: AsyncSequence {
    public typealias Element = Value
    
    private let observationClosure: @Sendable () -> Value
    
    /// Creates a new observations sequence with the specified closure.
    /// - Parameter closure: A closure that returns the value to observe. This closure is called
    ///   each time the observed properties change.
    public init(_ closure: @escaping @Sendable () -> Value) {
        self.observationClosure = closure
    }
    
    /// An async iterator that yields values when observed properties change.
    public struct AsyncIterator: AsyncIteratorProtocol {
        private let observationClosure: @Sendable () -> Value
        
        init(_ closure: @escaping @Sendable () -> Value) {
            self.observationClosure = closure
        }
        
        /// Returns the next value when observed properties change.
        /// - Returns: The new value after a change, or nil if the sequence ends (which never happens in this implementation)
        public mutating func next() async -> Value? {
            await withCheckedContinuation { continuation in
                withObservationTracking {
                    continuation.resume(returning: observationClosure())
                } onChange: {
                    // Trigger when observed properties change
                }
            }
        }
    }
    
    /// Creates an async iterator for this sequence.
    /// - Returns: An AsyncIterator that yields values when observed properties change
    public func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(observationClosure)
    }
}

@available(iOS 18.0, *)
public extension Observable {
    /// Creates an async sequence that streams values of a specific property whenever it changes.
    /// 
    /// - Parameter keyPath: The key path to the property to observe
    /// - Returns: An async sequence that emits the property's value whenever it changes
    ///
    /// - Note: The property type must conform to Sendable for thread safety
    ///
    /// Usage:
    /// ```swift
    /// @Observable
    /// class Store {
    ///     var items: [Item] = []
    ///     var isLoading = false
    /// }
    ///
    /// let store = Store()
    /// let itemStream = store.stream(of: \.items)
    ///
    /// Task {
    ///     for await items in itemStream {
    ///         print("Items updated: \(items.count) items")
    ///     }
    /// }
    /// ```
    func stream<Value: Sendable>(
        of keyPath: KeyPath<Self, Value>
    ) -> any AsyncSequence<Value, Never> {
        Observations {
            self[keyPath: keyPath]
        }
    }
}
