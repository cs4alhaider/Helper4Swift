//
//  UITextField+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 5/11/18.
//

import UIKit

public enum UITextFieldMode {
    case ready
    case notReady
}

public extension UITextField {
    
    /// Checking if the textField is not empty to return notReady
    var mode: UITextFieldMode {
        guard let text = self.text else { return .notReady }
        return text.isNotEmpty == true ? (.ready) : (.notReady)
    }
}

public extension UITextField {
    
    /// Adding an image to the left of the textFeild.
    ///
    /// - Parameters:
    ///   - image: image to use .. best to use PDF image.
    ///   - color: image color
    func left(image: UIImage?, color: UIColor = .black, width: CGFloat = 20, height: CGFloat = 20) {
        if let image = image {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
    }
    
    /// Adding an image to the right of the textFeild
    ///
    /// - Parameters:
    ///   - image: image to use .. best to use PDF image.
    ///   - color: image color
    func right(image: UIImage?, color: UIColor = .black, width: CGFloat = 20, height: CGFloat = 20) {
        if let image = image {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
            imageView.tintColor = color
            rightView = imageView
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
    }
    
    /// Set placeholder text color.
    ///
    /// - Parameter color: placeholder text color.
    func setPlaceHolderTextColor(_ color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
    /// Set placeholder text and its color
    func placeholderTextAndColor(text value: String, color: UIColor = .red) {
        self.attributedPlaceholder = NSAttributedString(string: value, attributes: [ NSAttributedString.Key.foregroundColor: color])
    }
    
    /// Sets bottom border
    ///
    /// - Parameters:
    ///     - color: Border color
    ///     - borderHeight: Border height
    func setBottomBorder(withColor color: UIColor, borderHeight: CGFloat) {
        borderStyle = .none
        layer.backgroundColor = UIColor.white.cgColor
        
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: borderHeight)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
    }
}
