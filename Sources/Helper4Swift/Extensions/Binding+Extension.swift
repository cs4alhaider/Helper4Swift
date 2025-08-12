//
//  Binding+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 04/01/2022.
//

import SwiftUI

@available(iOS 13.0, *)
public extension Binding {
    
    /// Get notified when the value changed
    /// 
    /// - Parameter handler: your own logic
    ///
    /// - Returns: same value
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}

@available(iOS 13.0, *)
extension Binding {
    
    /// Creates a `Binding<Bool>` to determine if the original `Binding`'s value is not `nil`.
    /// - Returns: A `Binding<Bool>` that is `true` if the original value is not `nil`, otherwise `false`.
    /// - Note: The setter only sets the value to `nil` when the bound `Bool` is set to `false`.
    /// - Usage:
    /// ```
    /// @State private var optionalString: String? = "Hello"
    /// let isNotNullBinding = $optionalString.isNotNull()
    /// ```
    public func isNotNull<V>() -> Binding<Bool> where Value == Optional<V> {
        return Binding<Bool>(get: { self.wrappedValue != nil },
                             set: { _ in self.wrappedValue = nil })
    }
    
    /// Transforms the current `Binding` into a new `Binding` of a different type using the provided getter and setter.
    /// - Parameters:
    ///   - getter: A closure that transforms the `Binding`'s current value to a new type.
    ///   - setter: A closure that updates the `Binding`'s value based on the transformed type's value.
    /// - Returns: A `Binding` of the new type.
    /// - Usage:
    /// ```
    /// @State private var intValue: Int = 0
    /// let stringBinding = $intValue.map(getter: { "\($0)" }, setter: { Int($0) ?? 0 })
    /// ```
    public func map<V>(getter: @escaping (Value) -> V, setter: @escaping (V) -> Value) -> Binding<V> {
        return Binding<V>(get: { getter(self.wrappedValue) },
                          set: { self.wrappedValue = setter($0) })
    }
    
    /// Creates a debounced `Binding` that delays the propagation of changes by the specified interval.
    /// - Parameter interval: The time interval to delay the propagation of value changes.
    /// - Returns: A debounced `Binding` of the original type.
    /// - Note: Useful for reducing the frequency of updates for continuously changing values, like text input.
    /// - Usage:
    /// ```
    /// @State private var searchText: String = ""
    /// let debouncedSearchText = $searchText.debounce(0.5) // 0.5 seconds delay
    /// ```
    public func debounce(_ interval: TimeInterval) -> Binding<Value> {
        let bounce = Debouncer(interval: interval, sender: { self.wrappedValue = $0 })
        
        return Binding(get: { self.wrappedValue },
                       set: { bounce.send($0) })
    }
    
    /// Creates a `Binding<Bool>` that indicates whether an optional set contains a specific element.
    /// - Parameter element: The element to check for containment in the set.
    /// - Returns: A `Binding<Bool>` that is `true` if the set contains the element, otherwise `false`.
    /// - Usage:
    /// ```
    /// @State private var optionalSet: Set<Int>? = [1, 2, 3]
    /// let containsElementBinding = $optionalSet.contains(2) // true if 2 is in the set
    /// ```
    public func contains<Element>(_ element: Element) -> Binding<Bool> where Value == Optional<Set<Element>> {
        return Binding<Bool>(get: { return self.wrappedValue?.contains(element) ?? false },
                             set: { present in
                                if present {
                                    self.wrappedValue = (self.wrappedValue ?? Set()).union([element])
                                } else {
                                    var current = self.wrappedValue
                                    current?.remove(element)
                                    if current?.isEmpty == true {
                                        self.wrappedValue = nil
                                    } else {
                                        self.wrappedValue = current
                                    }
                                }
                             })
    }
}

extension Binding where Value == Bool {
    
    /// Provides a negated `Binding<Bool>` from the current `Binding<Bool>`.
    /// - Returns: A `Binding<Bool>` where the value is the logical negation of the original `Binding`'s value.
    /// - Usage:
    /// ```
    /// @State private var isDisabled: Bool = false
    /// let isEnabledBinding = $isDisabled.negated // true if `isDisabled` is false
    /// ```
    public var negated: Binding<Bool> {
        return Binding(get: { !self.wrappedValue },
                       set: { self.wrappedValue = !$0 })
    }
    
}

extension Binding where Value: SetAlgebra {
    
    /// Creates a `Binding<Bool>` to determine if the current `Binding`'s set contains a specific element.
    /// - Parameter element: The element to check for containment in the set.
    /// - Returns: A `Binding<Bool>` that is `true` if the set contains the element, otherwise `false`.
    /// - Usage:
    /// ```
    /// @State private var mySet: Set<Int> = [1, 2, 3]
    /// let containsElementBinding = $mySet.contains(2) // true if 2 is in the set
    /// ```
    public func contains(_ element: Value.Element) -> Binding<Bool> {
        return Binding<Bool>(get: { wrappedValue[contains: element] },
                             set: { wrappedValue[contains: element] = $0 })
    }
    
}

/// A utility class for debouncing values over a specified time interval.
private class Debouncer<Value> {
    let interval: TimeInterval
    let sender: (Value) -> Void
    
    private var current: DispatchWorkItem?
    
    /// Initializes a `Debouncer` with a specified time interval and a sender closure to debounce value changes.
    /// - Parameters:
    ///   - interval: The time interval to wait before sending the value.
    ///   - sender: The closure to call with the value after the interval has passed.
    /// - Usage:
    /// This class is used internally by the `debounce` function of the `Binding` extension and is not intended for direct public use.
    init(interval: TimeInterval, sender: @escaping (Value) -> Void) {
        self.interval = interval
        self.sender = sender
    }
    
    /// Sends a value using the debouncer, canceling any previous pending send operations.
    /// - Parameter value: The value to be debounced.
    func send(_ value: Value) {
        current?.cancel()
        let work = DispatchWorkItem(block: { self.sender(value) })
        this.current = work
        DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: work)
    }
    
}
