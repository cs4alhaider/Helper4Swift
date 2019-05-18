//
//  String+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 5/11/18.
//  https://developer.apple.com/library/content/documentation/Xcode/Reference/xcode_markup_formatting_ref/

import Foundation

public extension String {
    
    /// Convert Arabic numbers to English numbers
    ///
    /// - Author: Abdullah Alhaider
    var toEnglishNumbers: String {
        var str = self
        let map = ["٠": "0",
                   "١": "1",
                   "٢": "2",
                   "٣": "3",
                   "٤": "4",
                   "٥": "5",
                   "٦": "6",
                   "٧": "7",
                   "٨": "8",
                   "٩": "9"]
        map.forEach { str = str.replacingOccurrences(of: $0, with: $1) }
        return str
    }
    
    /// Used for change the language
    ///
    /// - Author: Abdullah Alhaider
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    
    /// Readable way to use !text.isEmpty
    ///
    /// - Author: Abdullah Alhaider
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    /// Shortcut of: UIImage(named: "imageName")
    ///
    /// - Author: Abdullah Alhaider
    var asImage: UIImage? {
        return UIImage(named: self)
    }
    
    /// Shortcut for string urls like: URL(string: "http://google.com")
    ///
    /// - Author: Abdullah Alhaider
    var asURL: URL? {
        return URL(string: self)
    }
    
    /// Shortcut for Notification.Name like: Notification.Name(rawValue: "string")
    ///
    /// - Author: Abdullah Alhaider
    var asNotificationName: Notification.Name {
        return Notification.Name(rawValue: self)
    }
    
    /// Shortcut for `UIStoryboard(name: "UIStoryboard", bundle: nil)`
    ///
    /// - Author: Abdullah Alhaider
    var asStoryboard: UIStoryboard {
        return UIStoryboard(name: self, bundle: nil)
    }
    
    /// Checking if string is empty and does not contain white spaces
    ///
    /// - Author: Abdullah Alhaider
    var isEmptyAtAll: Bool {
        if self.isEmpty && !isWhiteSpaceOnly {
            return true
        }
        return false
    }
    
    /// Return only the digits from a string
    ///
    /// - Author: Abdullah Alhaider
    var onlyDigits: String {
        let set = NSCharacterSet.decimalDigits.inverted
        return self.components(separatedBy: set).joined(separator: "")
    }
    
    /// Return same string withot whitespaces or newlines
    ///
    /// - Author: Abdullah Alhaider
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Return true if the string matched an email format like "cs.alhaider@gmail.com"
    ///
    /// - Author: Abdullah Alhaider
    var isValidEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" // This is a regular expression
        return self.matches(emailFormat)
    }
    
    /// Return true if the string has only numbers "0123456789".
    ///
    /// - Author: Abdullah Alhaider
    var isValidNumber: Bool {
        let numberFormat = "^[0-9]*$"
        return self.matches(numberFormat)
    }
    
    /// Return true if the string has minimum 8 characters, and at least one uppercase letter, and one lowercase letter and one number
    /// , You can see more on http://regexlib.com/Search.aspx?k=password
    ///
    /// - Author: Abdullah Alhaider
    var isValidPassword: Bool {
        let passwordFormat = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$"
        return self.matches(passwordFormat)
    }
    
    /// Validating a string whether it is hexadecimal color or not using regular expression
    ///
    /// - Author: Abdullah Alhaider
    var isValidHex: Bool {
        let hexadecimalFormat = "^#(?:[0-9a-fA-F]{3}){1,2}$"
        return self.matches(hexadecimalFormat)
    }
    
    /// Return true if the string is a valid url
    ///
    /// - Author: Abdullah Alhaider
    var isValidUrl: Bool {
        return URL(string: self) != nil
    }
    
    /// Checking for whitespace
    ///
    /// - Author: Abdullah Alhaider
    var isWhiteSpaceOnly: Bool {
        if self.isEmpty {
            return false
        }
        let emptyFormat = "\\s*"
        return self.matches(emptyFormat)
    }
    
    /// Checking if string contain only 0s
    ///
    /// - Author: Abdullah Alhaider
    var isStringOnlyZeros: Bool {
        let zeroFormat = "^[0٠]+$"
        return self.matches(zeroFormat)
    }
    
    /// String decoded from base64 (if applicable).
    ///
    /// "SGVsbG8gV29ybGQh".base64Decoded = Optional("Hello World!")
    ///
    /// - Author: Abdullah Alhaider
    var base64Decoded: String? {
        guard let decodedData = Data(base64Encoded: self) else { return nil }
        return String(data: decodedData, encoding: .utf8)
    }
    
    /// String encoded in base64 (if applicable).
    ///
    /// "Hello World!".base64Encoded -> Optional("SGVsbG8gV29ybGQh")
    ///
    /// - Author: Abdullah Alhaider
    var base64Encoded: String? {
        let plainData = data(using: .utf8)
        return plainData?.base64EncodedString()
    }
    
    /// Readable string from a URL string.
    ///
    /// "it's%20easy%20to%20decode%20strings".urlDecoded -> "it's easy to decode strings"
    ///
    /// - Author: Abdullah Alhaider
    var urlDecoded: String {
        return removingPercentEncoding ?? self
    }
    
    /// URL escaped string.
    ///
    /// "it's easy to encode strings".urlHostAllowed -> "it's%20easy%20to%20encode%20strings"
    ///
    /// - Author: Abdullah Alhaider
    var urlHostAllowed: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
    /// URL escaped string to add percent encoding using .urlQueryAllowed
    ///
    /// - Author: Abdullah Alhaider
    var urlQueryAllowed: String {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
    
}

// MARK: - // -------------------------------- Methods ------------------------------------- //

extension String {
    
    /// Replacing string with another string "aaa" => "ttt"
    ///
    /// - Parameters:
    ///   - string: orignal string
    ///   - replacement: replacment string
    /// - Returns: replaced text
    /// - Author: Abdullah Alhaider
    func replace(string: String, replacement: String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: String.CompareOptions.literal, range: nil)
    }
    
    /// Removing the white space in any string by calling removeWhitespace() after a string value
    ///
    /// - Returns: String with no white space in
    /// - Author: Abdullah Alhaider
    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "")
    }
    
    /// Validate for if regex matches
    ///
    /// - Parameter regex: regular expression
    /// - Returns: true if matches the given regex
    ///
    /// - Author: Abdullah Alhaider
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression) != nil
    }
    
    /// Open url using the string
    ///
    /// - Author: Abdullah Alhaider
    func openUrl() {
        guard let url = URL(string: self) else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:])
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    /// Open in messages if the string is valid number
    ///
    /// - Parameter message: message body
    ///
    /// - Author: Abdullah Alhaider
    func openInMessagess(message: String) {
        if self.isValidNumber {
            "sms:\(self)&body=\(message.urlQueryAllowed)".openUrl()
        }
    }
    
    /// Calling ussd number
    ///
    /// - Author: Abdullah Alhaider
    func call() {
        let urlString = self.urlHostAllowed
        guard let url = URL(string: "tel://\(urlString)") else { return }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:])
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    /// Counting the length and returning a boolen value
    ///
    /// - Parameters:
    ///   - min: minmum length
    ///   - max: maxmum length
    /// - Returns: true if the length is more than or equel the `min` and length is less than or equel the `max`
    ///
    /// - Author: Abdullah Alhaider
    func lengthIsBetween(min: Int, max: Int) -> Bool {
        return (self.count >= min) && (self.count <= max)
    }
}
