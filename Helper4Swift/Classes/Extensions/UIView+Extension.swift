//
//  UIView+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 5/11/18.
//

import UIKit

public extension UIView {
    
    /**
     Adds a vertical gradient layer with two **UIColors** to the **UIView**.
     - Parameter topColor: The top **UIColor**.
     - Parameter bottomColor: The bottom **UIColor**.
     */
    
    public func addVerticalGradientLayer(topColor:UIColor, bottomColor:UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            topColor.cgColor,
            bottomColor.cgColor
        ]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    // To use it in you viewDidLoad() -->> view.addVerticalGradientLayer(topColor: UIColor.black, bottomColor: UIColor.red)
    
    
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    public func applyViewDesign(masksToBounds: Bool = false,
                                shadowColor: UIColor = .black,
                                cornerRadius: CGFloat = 0.0,
                                shadowOpacity: Float = 0.0,
                                shadowOffset: CGSize = CGSize(width: 0, height: 0),
                                shadowRadius: CGFloat = 0.0) {
        
        self.layer.masksToBounds = masksToBounds
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.cornerRadius = cornerRadius
        //self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = false
        //self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    /// A layout anchor representing all the edges of the view’s frame.
    ///
    /// - Parameters:
    ///   - top: top anchor of the view
    ///   - left: left anchor of the view
    ///   - bottom: bottom anchor of the view
    ///   - right: right anchor of the view
    ///   - topConstant: constant of the top anchor
    ///   - leftConstant: constant of the left anchor
    ///   - bottomConstant: constant of the bottom anchor
    ///   - rightConstant: constant of the right anchor
    public func anchor(top: NSLayoutYAxisAnchor? = nil,
                       left: NSLayoutXAxisAnchor? = nil,
                       bottom: NSLayoutYAxisAnchor? = nil,
                       right: NSLayoutXAxisAnchor? = nil,
                       topConstant: CGFloat = 0,
                       leftConstant: CGFloat = 0,
                       bottomConstant: CGFloat = 0,
                       rightConstant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
        }
        
    }
    
    
    
    /// A layout anchor representing the dimensions of the view’s frame.
    ///
    /// - Parameters:
    ///   - height: height of the view
    ///   - width: width of the view
    ///   - centerX: X center of the view
    ///   - centerY: Y center of the view
    ///   - centerXConstant: constant of X
    ///   - centerYConstant: constant of Y
    public func anchorWithDimensions(height: CGFloat? = nil,
                                     width: CGFloat? = nil,
                                     centerX: NSLayoutXAxisAnchor? = nil,
                                     centerY: NSLayoutYAxisAnchor? = nil,
                                     centerXConstant: CGFloat = 0,
                                     centerYConstant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX, constant: centerXConstant).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY, constant: -centerYConstant).isActive = true
        }
    }
    
    
    /// A layout anchor representing the dimensions with multiplier of the view’s frame.
    ///
    /// - Parameters:
    ///   - height: height of the view you want to count on
    ///   - width: width of the view you want to count on
    ///   - heightMultiplier: height multiplier
    ///   - widthMultiplier: width multiplier
    ///   - centerX: X center of the view
    ///   - centerY: Y center of the view
    ///   - centerXConstant: constant of X
    ///   - centerYConstant: constant of Y
    public func anchorWithMultiplier(height: NSLayoutDimension? = nil,
                                     width: NSLayoutDimension? = nil,
                                     heightMultiplier: CGFloat = 1,
                                     widthMultiplier: CGFloat = 1,
                                     centerX: NSLayoutXAxisAnchor? = nil,
                                     centerY: NSLayoutYAxisAnchor? = nil,
                                     centerXConstant: CGFloat = 0,
                                     centerYConstant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let height = height {
            heightAnchor.constraint(equalTo: height, multiplier: heightMultiplier).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalTo: width, multiplier: widthMultiplier).isActive = true
        }
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX, constant: centerXConstant).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY, constant: -centerYConstant).isActive = true
        }
    }
}

