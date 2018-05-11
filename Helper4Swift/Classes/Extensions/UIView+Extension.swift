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
    
    
    
    /**********************************************************************************************/
    /**********************************************************************************************/
    
    
    // OUTPUT 1
    public func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 13
        layer.cornerRadius = 15
        //layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        //layer.shouldRasterize = true
        //layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    public func dropShadow(color: UIColor, cornerRadius: CGFloat, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat /*, scale: Bool = true*/ ) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.cornerRadius = cornerRadius
        
        //layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = false
        //layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    
    
    /**********************************************************************************************/
    /**********************************************************************************************/
    
    
    
}

