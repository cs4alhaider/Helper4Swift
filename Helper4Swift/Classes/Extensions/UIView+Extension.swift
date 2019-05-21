//
//  UIView+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 5/11/18.
//

import UIKit

/// Two cases replacing `isHidden`
///
/// - visible: means `isHidden = false`
/// - hidden: means `isHidden = true`
///
/// - Author: Abdullah Alhaider.
public enum UIViewDisplayMode {
    case visible
    case hidden
    // Please do not add any extra cases
}

public extension UIView {
    
    /// Elegent way to show and hide any UIView insted of `someView.isHidden = true` or `!someView.isHidden = true`
    ///
    /// - Author: Abdullah Alhaider.
    var display: UIViewDisplayMode {
        get {
            return self.isHidden ? .hidden : .visible
        }
        set {
            self.isHidden = newValue == .hidden ? true : false
        }
    }
    
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    var borderColor: CGColor? {
        get {
            return self.layer.borderColor
        }
        set {
            self.layer.borderColor = newValue
        }
    }
}

public extension UIView {
    
    /// Adding array of views to the subView
    ///
    /// - Parameter views: UIView | UIButton | UIImageView and all other UIKit elements
    ///
    /// - Author: Abdullah Alhaider.
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
    
    /// Adds a vertical gradient layer with two **UIColors** to the **UIView**.
    ///
    /// - Parameters:
    ///   - topColor: The top
    ///   - bottomColor: The bottom
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    /// Adding round corners to a UIView | UIButton | UIImageView and all other UIKit elements
    ///
    /// - Parameters:
    ///   - corners: .topLeft | .topRight | .bottomLeft | .bottomRight
    ///   - radius: corner radius
    ///
    /// - Author: Abdullah Alhaider
    func roundCorners(corners: UIRectCorner = .allCorners, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            layer.cornerRadius = radius
            guard !corners.contains(.allCorners) else { return }
            layer.maskedCorners = []
            if corners.contains(.topLeft) {
                layer.maskedCorners.insert(.layerMaxXMinYCorner)
            }
            if corners.contains(.topRight) {
                layer.maskedCorners.insert(.layerMinXMinYCorner)
            }
            if corners.contains(.bottomLeft) {
                layer.maskedCorners.insert(.layerMinXMaxYCorner)
            }
            if corners.contains(.bottomRight) {
                layer.maskedCorners.insert(.layerMaxXMaxYCorner)
            }
        } else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
    
    /// Helper method for addSubviewFromNib() to load the nib file into UIView subclass
    ///
    /// - Author: Abdullah Alhaider.
    private func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        return view ?? UIView()
    }
    
    /// Adding the nib file with UIView class
    ///
    /// - Author: Abdullah Alhaider.
    func addSubviewFromNib() {
        let view = viewFromNibForClass()
        view.frame = bounds
        // autolayout
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    /// Setting up array of labels
    ///
    /// - Parameters:
    ///   - labels: array of labels
    ///   - textColor: text color for all
    ///   - font: font
    ///
    /// - Author: Abdullah Alhaider.
    func setupLabels(_ labels: [UILabel], textColor: UIColor? = nil, font: UIFont? = nil) {
        labels.forEach {
            if let newColor = textColor {
                $0.textColor = newColor
            }
            if let newFont = font {
                $0.font = newFont
            }
        }
    }
    
    /// Adding localization to array of UILabels
    ///
    /// - Parameter dictionary: `[UILabel: String]` String will be the localization key.
    ///
    /// - Author: Abdullah Alhaider.
    func addLocalization(_ dictionary: [UILabel: String]) {
        for (label, string) in dictionary {
            label.text = string.localized
        }
    }
    
    // ---------------------------- UIViewAnimation -------------------------------- //
    
    /// Multible of cases to animate any UIView
    ///
    /// - Author: Abdullah Alhaider.
    enum UIViewAnimation {
        /// Will change the color and animate if the duration > 0
        case changeColor(to: UIColor, duration: TimeInterval)
        /// Will hide the view and reduce the alpha value to 0 with animation if the duration > 0
        case hideView(duruation: TimeInterval)
        /// Will show the view and increase the alpha value to 1 with animation if the duration > 0
        case showView(duruation: TimeInterval)
    }
    
    /// Implimntation for all cases in `UIViewAnimation`
    ///
    /// - Parameter animation: UIViewAnimation
    ///
    /// - Author: Abdullah Alhaider.
    func animate(_ animation: UIViewAnimation) {
        switch animation {
        case .changeColor(let newColor, let duration):
            UIView.animate(withDuration: duration) {
                self.backgroundColor = newColor
            }
        case .hideView(let duruation):
            UIView.animate(withDuration: duruation) {
                self.alpha = 0
                self.display = .hidden
            }
        case .showView(let duruation):
            UIView.animate(withDuration: duruation) {
                self.display = .visible
                self.alpha = 1
            }
        }
    }
    
    func applyShadowWithRoundCorners(masksToBounds: Bool = false,
                                     shadowColor: UIColor = .black,
                                     cornerRadius: CGFloat = 0.0,
                                     shadowOpacity: Float = 0.0,
                                     shadowOffset: CGSize = CGSize(width: 0, height: 0),
                                     shadowRadius: CGFloat = 0.0) {
        
        layer.masksToBounds = masksToBounds
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.cornerRadius = cornerRadius
        layer.shouldRasterize = false
    }
    
    /// Create an image from a UIView
    ///
    /// - Returns: optional image
    ///
    /// - Author: Abdullah Alhaider.
    func takeScreenshot() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
