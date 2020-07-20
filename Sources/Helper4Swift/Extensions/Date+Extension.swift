//
//  Date+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import Foundation

/// Cases of the date formate
public enum DateFormat: String {
    /// MMMMddYYYYWithTime: OCT 10, 2019 at 12:32 am
    case MMMMddYYYYWithTime = "MMMM dd, yyyy 'at' h:mm a"
    /// ddmmyyyyWithTime: 23/10/2019 at 12:32 am
    case ddmmyyyyWithTime = "dd/MM/yyyy 'at' h:mm a"
    case requestDateFormat = "dd-MM-yyyy hh:mm:ss.SSSSS"
    case YYYYMMDD = "yyyyMMdd"
    case DDMMMYYYY = "dd MMM yyyy"
    case DateWithTimeZone = "yyyy-MM-dd'T'HH:mm:Ss.SSSZ" // Time zone date
    case MMMYYY = "MMM yyy" /// For date used in view bills
    case MMM = "MMM"
    /*
     You can add as many format as you want
     and if you not familiar with other date format you can use this website
     to pick your best format http://nsdateformatter.com
     */
}

public extension Date {
    
    /// Getting the current date in selected format
    ///
    /// - Parameter format: date format
    /// - Returns: the current date in the selected format
    func getCurrentDate(format: DateFormat = .DDMMMYYYY) -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = format.rawValue // from enum dateFormat
        let formatedDate = formatter.string(from: date)
        
        return formatedDate
    }
    
    /// Getting the current date by passing your custom date format
    ///
    /// - Parameter formatToUse: your custom date format
    /// - Returns: current date
    func getCurrentDateUsingThisFormat(_ formatToUse: String = "dd/MM/yyyy 'at' h:mm a") -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = formatToUse
        let formatedDate = formatter.string(from: date)
        
        return formatedDate
    }
    
    /// Calculating the time interval since a given date
    ///
    /// - Parameter date: Date()
    /// - Returns: time interval
    func timeSince(_ date: Date) -> TimeInterval {
        let time = Date()
        return time.timeIntervalSince(date)
    }
}
