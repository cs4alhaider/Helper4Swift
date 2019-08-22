//
//  UIKeyboardType+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import UIKit

public extension UIKeyboardType {
    
    /// UIKeyboardType to show only the numbers keyboard
    static var onlyNumbers: UIKeyboardType {
        if #available(iOS 10.0, *) {
            return .asciiCapableNumberPad
        } else {
            return .numberPad
        }
    }
}
