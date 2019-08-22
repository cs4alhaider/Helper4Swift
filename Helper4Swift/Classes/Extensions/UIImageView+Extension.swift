//
//  UIImageView+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 5/11/18.
//

import UIKit

public extension UIImageView {
    
    func applyDesgin(clipsToBounds: Bool = true,
                     cornerRadius: CGFloat? = nil,
                     borderWidth: CGFloat? = nil,
                     borderColor: UIColor? = nil) {
        
        self.clipsToBounds = clipsToBounds
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
        }
        if let borderWidth = borderWidth {
            self.layer.borderWidth = borderWidth
        }
        if let borderColor = borderColor {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}// extension end.
