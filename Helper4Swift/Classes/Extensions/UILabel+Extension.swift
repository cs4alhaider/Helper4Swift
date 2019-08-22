//
//  UILabel+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 6/18/18.
//

import UIKit

public extension UILabel {
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
    
    
    /// Adding under line to the text
    func addUnderline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
    
    /// Multible cases to animate the UILabel
    enum UILabelAnimation {
        /// Will change the text color and animate if the duration > 0
        case changeTextColor(to: UIColor, duration: TimeInterval)
    }
    
    /// Implimntation for all cases in `UILabelAnimation`
    ///
    /// - Parameter animation: UILabelAnimation
    func labelAnimation(_ animation: UILabelAnimation) {
        switch animation {
        case .changeTextColor(let newColor, let duration):
            UIView.animate(withDuration: duration) {
                self.textColor = newColor
            }
        }
    }
}
