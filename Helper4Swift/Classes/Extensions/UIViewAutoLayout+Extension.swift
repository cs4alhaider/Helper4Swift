//
//  UIViewAutoLayout+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import UIKit

public extension UIView {
    
    /* ------------------------------- Auto layout -------------------------------- */
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leftAnchor
        }
        return leftAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.rightAnchor
        }
        return rightAnchor
    }
    
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
    ///
    /// - Author: Abdullah Alhaider
    func anchor(top: NSLayoutYAxisAnchor? = nil,
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
    
    func anchorToEdges(view: UIView, padding: CGFloat = 0) {
        anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor,
               topConstant: padding, leftConstant: padding, bottomConstant: padding, rightConstant: padding)
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
    ///
    /// - Author: Abdullah Alhaider
    func anchorWithDimensions(height: CGFloat? = nil,
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
    ///
    /// - Author: Abdullah Alhaider
    func anchorWithMultiplier(height: NSLayoutDimension? = nil,
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
    
    /// Filling the view to it's superview
    ///
    /// - Author: Abdullah Alhaider
    func fillSuperview() {
        guard let superview = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = superview.translatesAutoresizingMaskIntoConstraints
        if translatesAutoresizingMaskIntoConstraints {
            autoresizingMask = [.flexibleWidth, .flexibleHeight]
            frame = superview.bounds
        } else {
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
        }
    }
}
