//
//  UITextView+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import UIKit

public extension UITextView {
    
    /// Scroll to the bottom of text view
    func scrollToBottom() {
        let range = NSRange(location: (text as String).count - 1, length: 1)
        scrollRangeToVisible(range)
    }
    
    /// Scroll to the top of text view
    func scrollToTop() {
        let range = NSRange(location: 0, length: 1)
        scrollRangeToVisible(range)
    }
}
