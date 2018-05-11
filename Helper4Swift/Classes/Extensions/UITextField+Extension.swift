//
//  UITextField+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 5/11/18.
//

import UIKit

public extension UITextField {
    
    public func addUnderlineDesign(borderColor: UIColor,
                                   borderWidth: CGFloat,
                                   masksToBounds: Bool) {
        
        let border = CALayer()
        border.borderColor = borderColor.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = masksToBounds
    }
}
