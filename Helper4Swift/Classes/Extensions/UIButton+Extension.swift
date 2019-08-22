//
//  UIButton+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 5/11/18.
//

import UIKit

public enum ButtonImagePosition {
    case left
    case right
}

public extension UIButton {
    
    /// Shorter way to setTitle
    func title(_ title: String, state: UIControl.State = .normal) {
        setTitle(title, for: state)
    }
    
    /// Shorter way to setTitleColor
    func titleColor(color: UIColor, state: UIControl.State = .normal) {
        setTitleColor(color, for: state)
    }
    
    /// Shorter way to setImage
    func withImage(_ image: UIImage, state: UIControl.State = .normal) {
        setImage(image, for: state)
    }
    
    /// Sets image insets with conformance to user interface direction
    ///
    /// - Parameters:
    ///     - insets: Image insets
    ///     - direction: User interface direction
    func setImageEdgeInsets(_ insets: UIEdgeInsets, direction: UIUserInterfaceLayoutDirection) {
        if UIApplication.shared.userInterfaceLayoutDirection != direction {
            imageEdgeInsets = UIEdgeInsets(top: insets.top, left: insets.right, bottom: insets.bottom, right: insets.left)
        } else {
            imageEdgeInsets = insets
        }
    }
    
    /// Sets title insets with conformance to user interface direction
    ///
    /// - Parameters:
    ///     - insets: Title insets
    ///     - direction: User interface direction
    func setTitleEdgeInsets(_ insets: UIEdgeInsets, direction: UIUserInterfaceLayoutDirection) {
        if UIApplication.shared.userInterfaceLayoutDirection != direction {
            titleEdgeInsets = UIEdgeInsets(top: insets.top, left: insets.right, bottom: insets.bottom, right: insets.left)
        } else {
            titleEdgeInsets = insets
        }
    }
    
    /// Sets position of image
    ///
    /// - Parameters:
    ///     - position: Image position
    func setImagePosition(_ position: ButtonImagePosition) {
        switch position {
        case .left: semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceRightToLeft : .forceLeftToRight
        case .right: semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
        }
    }
    
    /// Adding under line to button text
    func addUnderline() {
        guard let text = self.titleLabel?.text else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: text.count))
        
        self.setAttributedTitle(attributedString, for: .normal)
    }
    
    /// Multible cases to animate the UIButton
    enum UIButtonAnimation {
        /// Will change the text color and animate if the duration > 0
        case changeTextColor(to: UIColor, duration: TimeInterval)
    }
    
    /// Implimntation for all cases in `UIButtonAnimation`
    ///
    /// - Parameter animation: UIButtonAnimation
    func buttonAnimation(_ animation: UIButtonAnimation) {
        switch animation {
        case .changeTextColor(let newColor, let duration):
            UIView.animate(withDuration: duration) {
                self.titleColor(color: newColor)
            }
        }
    }
}

