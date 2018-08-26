//
//  String+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 5/11/18.
//  https://developer.apple.com/library/content/documentation/Xcode/Reference/xcode_markup_formatting_ref/

import Foundation

public extension String {
    
    
    
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var asImage: UIImage {
        return UIImage(named: self) ?? UIImage()
    }
    
    /// Checking if string is empty and does not contain white spaces
    var isEmptyAtAll: Bool {
        if self.isEmpty && !isWhiteSpaceOnly {
            return true
        }
        return false
    }
    
    /* -------------------------------------------------------------------------------- */
    /* -- Learn about regular expression in => https://www.regexbuddy.com/regex.html -- */
    /* ---------------- Test any reg on => https://www.regextester.com ---------------- */
    /* -------------------------------------------------------------------------------- */
    
    
    /**
     Return true if the string matched an email format like "abdullah@alhaider.net" .
     *How to use :*
     Declare a variable or constant like ==> let email = "abc@efg.com".isValidEmail
     *Values :*
     `emailFormat` Passing a regulare expression string "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}".
     `emailPredicate` NSPredicate.
     - important: Regular expression is case sensitive.
     - returns: true.
     - Author: Abdullah Alhaider
     */
    public var isValidEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}" // This is a regular expression
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }

    
    /* -------------------------------------------------------------------------------- */
    
    
    /**
     Return true if the string has only numbers "0123456789".
     *How to use :*
     Declare a variable or constant like ==> let number = "12345".isValidNumber
     *Values*
     `numberFormat` : Numbers regulare expression string "^[0-9]*$".
     `numberPredicate` : NSPredicate(format:"SELF MATCHES %@", numberFormat).
     - important: Regular expression is case sensitive.
     - returns: true.
     - Author:
     Abdullah Alhaider
     */
    
    public var isValidNumber: Bool {
        let numberFormat = "^[0-9]*$"
        let numberPredicate = NSPredicate(format:"SELF MATCHES %@", numberFormat)
        return numberPredicate.evaluate(with: self)
    }
    
    
    /* -------------------------------------------------------------------------------- */
    
    
    /**
     Return true if the string has minimum 8 characters, and at least one uppercase letter, and one lowercase letter and one number
     , You can see more on http://regexlib.com/Search.aspx?k=password
     *How to use :*
     Declare a variable or constant like ==> let password = "Gg123456".isValidPassword
     *Values*
     `passwordFormat` : Password regulare expression string "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$".
     `passwordPredicate` : NSPredicate(format:"SELF MATCHES %@", passwordFormat).
     - important: Regular expression is case sensitive.
     - returns: true.
     - Author: Abdullah Alhaider
     */
    
    public var isValidPassword: Bool {
        let passwordFormat = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordFormat)
        return passwordPredicate.evaluate(with: self)
    }
    
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    
    /**
     Return true if the string is a valid url.
     *How to use :*
     Declare a variable or constant like ==> let url = "https://google.com".isValidUrl
     - returns: true.
     - Author: Abdullah Alhaider
     */
    
    public var isValidUrl: Bool {
        return URL(string: self) != nil
    }
    
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    public var isWhiteSpaceOnly: Bool {
        if self.isEmpty {
            return false
        }
        let emptyFormat = "\\s*"
        let emptyPerdicate = NSPredicate(format:"SELF MATCHES %@", emptyFormat)
        return emptyPerdicate.evaluate(with: self)
    }
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    public var isStringOnlyZeros: Bool {
        let ZeroFormat = "^[0٠]+$"
        let ZeroPerdicate = NSPredicate(format:"SELF MATCHES %@", ZeroFormat)
        return ZeroPerdicate.evaluate(with: self)
    }
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    
    /**
     Replacing string with another string "aaa" => "ttt".
     *How to use :*
     replace(string: " ", replacement: "")
     *Values*
     `numberFormat` string.
     `numberPredicate` replacement.
     - returns: String .
     - Author: Abdullah Alhaider.
     */
    
    public func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
    
    
    /* -------------------------------------------------------------------------------- */
    
    /**
     Removing the white space in any string by calling removeWhitespace() after a string value.
     *How to use :*
     Declare a variable or constant like ==> let text = "H e l l o   W o r l d !".removeWhitespace()
     - returns: String with no white space in.
     - Author: Abdullah Alhaider.
     */
    
    public func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "")
    }
    
    /* -------------------------------------------------------------------------------- */
    
    /**
     Replacing string by another string .
     - returns: String.
     - Author: Abdullah Alhaider.
     */
    
    public func replaceString(existingString: String, replaceItWith: String ) -> String {
        return self.replace(string: existingString, replacement: replaceItWith)
    }
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    
    
    
}// Extension ends.
