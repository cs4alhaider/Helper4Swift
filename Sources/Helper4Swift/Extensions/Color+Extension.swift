//
//  Color+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 19/03/2022.
//

import SwiftUI

@available(iOS 13.0, *)
public extension Color {
    
    func uiColor() -> UIColor {
        
        if #available(iOS 14.0, *) {
            return UIColor(self)
        }
        
        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }
    
    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        
        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        
        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}

@available(iOS 14.0, *)
public extension Color {
    
    /// Converts a SwiftUI Color to a hexadecimal string representation.
    ///
    /// - Returns: A String representing the color in hexadecimal format.
    ///   Returns nil if the color cannot be converted to RGB.
//    func toHexString() -> String? {
//        // Convert the Color to UIColor
//        let uiColor = UIColor(self)
//        
//        // Extract RGBA components from UIColor
//        var red: CGFloat = 0
//        var green: CGFloat = 0
//        var blue: CGFloat = 0
//        var alpha: CGFloat = 0
//
//        guard uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
//            // Return nil if unable to extract RGBA components
//            return nil
//        }
//
//        // Format the components as a hexadecimal string
//        return String(
//            format: "#%02lX%02lX%02lX",
//            lround(Double(red) * 255),
//            lround(Double(green) * 255),
//            lround(Double(blue) * 255)
//        )
//    }
    
    // Initialize Color from Hex String
    init(hex: String) {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.currentIndex = hexString.index(after: hexString.startIndex)
        }
        
        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255
        let green = CGFloat(g) / 255
        let blue  = CGFloat(b) / 255
        
        self.init(red: red, green: green, blue: blue)
    }
    
    
    /// Determines if the color is perceived as dark or light.
    /// This method calculates the relative luminance of the color in the sRGB space
    /// and compares it against a threshold to decide if the color is dark.
    ///
    /// - Returns: A Boolean value indicating whether the color is dark (`true`) or light (`false`).
    func isDarkColor() -> Bool {
        // Extract RGB components from the color
        guard let components = UIColor(self).cgColor.components, components.count >= 3 else {
            return false
        }
        
        // Assign RGB components to respective variables
        let red = components[0]
        let green = components[1]
        let blue = components[2]
        
        // Calculate luminance for each color component.
        // The formula converts the linear RGB values to sRGB,
        // which better represents human perception of brightness.
        let redLuminance = red < 0.03928 ? red / 12.92 : pow((red + 0.055) / 1.055, 2.4)
        let greenLuminance = green < 0.03928 ? green / 12.92 : pow((green + 0.055) / 1.055, 2.4)
        let blueLuminance = blue < 0.03928 ? blue / 12.92 : pow((blue + 0.055) / 1.055, 2.4)
        
        // Calculate the overall luminance of the color using the standard coefficients.
        // These coefficients (0.2126, 0.7152, 0.0722) correspond to the human eye's
        // sensitivity to red, green, and blue light, respectively.
        let luminance = 0.2126 * redLuminance + 0.7152 * greenLuminance + 0.0722 * blueLuminance
        
        // Compare the luminance against a threshold to determine if the color is dark.
        // The threshold value of 0.5 can be adjusted based on specific requirements.
        return luminance < 0.5
    }
}
