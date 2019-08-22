//
//  UIColor+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 5/11/18.
//

import UIKit

public extension UIColor {
    
    /// Allowing to use hex string
    ///
    /// - Parameter hexString: hex string like "ffffff"
    convenience init(hexString: String) {
        
        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let rColor = Int(color >> 16) & mask
        let gColor = Int(color >> 8) & mask
        let bColor = Int(color) & mask
        
        let red = CGFloat(rColor) / 255.0
        let green = CGFloat(gColor) / 255.0
        let blue = CGFloat(bColor) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    /// shortcut for RGB colors
    ///
    /// - Parameters:
    ///   - r: red
    ///   - g: green
    ///   - b: blue
    ///   - alpha: alpha = 1
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
}
