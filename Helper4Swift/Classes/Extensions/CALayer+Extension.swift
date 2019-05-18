//
//  CALayer+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 9/7/18.
//

import UIKit

public extension CALayer {
    
    /// Adding view border
    ///
    /// - Parameters:
    ///   - edge: UIRectEdge
    ///   - color: color of the border
    ///   - thickness: thickness of the border
    func addBorder(edge: UIRectEdge, color: UIColor? = .darkGray, thickness: CGFloat? = 1.0) {
        
        guard let color = color else { return }
        guard let thickness = thickness else { return }
        
        let border = CALayer();
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x:0, y:self.frame.height - thickness, width:self.frame.width, height:thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x:0, y:0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x:self.frame.width - thickness, y: 0, width: thickness, height:self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        addSublayer(border)
    }
    
    /// Add rounded corner to any corner
    ///
    /// - Parameters:
    ///   - corners: [CACornerMask]
    ///   - radius: corner radius
    func roundCorners(corners: CACornerMask, radius: CGFloat){
        self.masksToBounds = true
        self.cornerRadius = radius
        if #available(iOS 11.0, *) {
            self.maskedCorners = corners
        }
    }
}
