//
//  String+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 5/11/18.
//

import Foundation

public extension String {
    
    
    /***********************************************************************************/
    /***********************************************************************************/
    
    /* ------------ Test any reg on => https://www.regextester.com ------------- */
    
    // This helps you when creating sign up page
    public var isValidEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
    public var isValidNumber: Bool {
        let numberFormat = "^[0-9]*$"
        let numberPredicate = NSPredicate(format:"SELF MATCHES %@", numberFormat)
        return numberPredicate.evaluate(with: self)
    }
    
    public var isValidPassword: Bool {
        // Minimum 8 characters, at least one uppercase letter, one lowercase letter and one number:
        // You can see more on http://regexlib.com/Search.aspx?k=password
        let passwordFormat = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordFormat)
        return passwordPredicate.evaluate(with: self)
    }
    
    
    public var isValidUrl: Bool {
        return URL(string: self) != nil
    }
    
    
    /***********************************************************************************/
    /***********************************************************************************/
    
    
    
    // Those methods is to remove the white spacing in a string
    public func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
    // In your code just call removeWhitespace() after a string value
    public func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "")
    }
    
    
    /***********************************************************************************/
    /***********************************************************************************/
    
    
    
    
    
}// Extension ends.
