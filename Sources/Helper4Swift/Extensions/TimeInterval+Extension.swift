//
//  TimeInterval+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 23/08/2019.
//

import Foundation

public extension TimeInterval {
    
    static var oneHour: TimeInterval {
        return 3600
    }
    
    static var twoHour: TimeInterval {
        return oneHour * 2
    }
    
    static var oneDay: TimeInterval {
        return oneHour * 24
    }
    
    static var twoDays: TimeInterval {
        return oneDay * 2
    }
    
    static var threeDays: TimeInterval {
        return oneDay * 3
    }
    
    static var oneWeek: TimeInterval {
        return oneDay * 7
    }
    
    static var oneMonth: TimeInterval {
        return oneDay * 30
    }
    
    static var oneYear: TimeInterval {
        return oneDay * 365
    }
    
    static func customHour(hour: Int) -> TimeInterval {
        return oneHour * Double(hour)
    }
}
