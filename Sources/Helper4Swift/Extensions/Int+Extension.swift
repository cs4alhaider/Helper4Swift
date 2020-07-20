//
//  Int+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import Foundation

public extension Int {
    
    /// Convert Int timeIntervalSince1970 to string date
    ///
    /// - Parameter format: date format
    /// - Returns: string date
    func convertToDate(format: DateFormat = .DDMMMYYYY) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: date)
    }
}
