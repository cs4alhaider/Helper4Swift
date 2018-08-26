//
//  UITabBarController+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 8/25/18.
//

import UIKit

public extension UITabBarController {
    
    
    /// Creating a navigation controller for UIViewController in UITabBarController
    ///
    /// - Parameters:
    ///   - vc: UIViewController()
    ///   - iconImage: image to use for tab bar image
    ///   - title: title for the navigation controller and tab bar
    /// - Returns: UINavigationController
    public func creatNavController(for vc: UIViewController,
                                   iconImage: UIImage? = nil,
                                   title: String? = nil,
                                   barTintColor: UIColor? = nil,
                                   isTranslucent: Bool? = nil,
                                   largeTitle: Bool? = nil) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: vc)
        
        if let image = iconImage {
            navController.tabBarItem.image = image
        }
        
        if let title = title {
            navController.title = title
        }
        
        if let isTranslucent = isTranslucent {
            navController.navigationBar.isTranslucent = isTranslucent
        }
        
        if let barTintColor = barTintColor {
            navController.navigationBar.barTintColor = barTintColor
        }
        
        if let largeTitle = largeTitle {
            if #available(iOS 11.0, *) {
                navController.navigationBar.prefersLargeTitles = largeTitle
            }
        }
        
        return navController
    }
}

