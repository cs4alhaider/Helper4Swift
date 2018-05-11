//
//  String+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 5/11/18.
//

import Foundation

public extension String {
    
    
    
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
