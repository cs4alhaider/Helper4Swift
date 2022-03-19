//
//  Sequence+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 19/03/2022.
//

import Foundation

public enum SortOrder {
    case increasing, decreasing
}

public extension Sequence {
    
    func sorted<Value: Comparable>(by keyPath: KeyPath<Self.Element, Value>, order: SortOrder = .increasing) -> [Self.Element] {
        switch order {
        case .increasing:
            return self.sorted(by: { $0[keyPath: keyPath]  <  $1[keyPath: keyPath] })
        case .decreasing:
            return self.sorted(by: { $0[keyPath: keyPath]  >  $1[keyPath: keyPath] })
        }
    }
}
