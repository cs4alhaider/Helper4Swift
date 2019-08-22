//
//  NSMutableAttributedString+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import Foundation

public extension NSMutableAttributedString {
    
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
    
    @discardableResult
    func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        return self
    }
}
