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

