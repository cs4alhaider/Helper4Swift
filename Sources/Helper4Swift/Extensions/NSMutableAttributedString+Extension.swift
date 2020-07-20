//
//  NSMutableAttributedString+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import Foundation

#if canImport(UIKit)
import UIKit
#endif

public extension NSMutableAttributedString {
    
    #if !os(macOS)
    /// A neat way to make a combination of bold and normal texts in a single label
    ///
    /// - Parameters:
    ///   - text: The text to apply style on it
    ///   - font: your font
    ///   - color: your foreground color
    /// - Returns: NSMutableAttributedString
    @discardableResult
    func bold(_ text: String, font: UIFont = UIFont.systemFont(ofSize: 17), color: UIColor = .black) -> NSMutableAttributedString {
        let boldString = NSMutableAttributedString(string: text, attributes: [.font: font, .foregroundColor: color])
        append(boldString)
        return self
    }
    #endif
    
    @discardableResult
    func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        return self
    }
}
