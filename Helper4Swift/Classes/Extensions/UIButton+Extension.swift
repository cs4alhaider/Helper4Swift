//
//  UIButton+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 5/11/18.
//

import UIKit


public extension UIButton {
    
    
    public func roundedButton(){
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    
    public func applyButtonDesign(title: String = "Button",
                     titleColor: UIColor = .white,
                     cornerRadius: CGFloat = 0.0,
                     backgroundColor: UIColor = .blue,
                     shadowColor: UIColor = .black,
                     shadowRadius: CGFloat = 0.0,
                     shadowOpacity: Float = 0.0) {
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        
        self.layer.cornerRadius = cornerRadius
        self.layer.backgroundColor = backgroundColor.cgColor
        
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        
    }
    
    
    
}// extension end.
