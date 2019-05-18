//
//  UIKeyboardType+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import UIKit

extension UIKeyboardType {
    
    /// UIKeyboardType to show only the numbers keyboard
    ///
    /// - Author: Abdullah Alhaider
    static var onlyNumbers: UIKeyboardType {
        if #available(iOS 10.0, *) {
            return .asciiCapableNumberPad
        } else {
            return .numberPad
        }
    }
}
