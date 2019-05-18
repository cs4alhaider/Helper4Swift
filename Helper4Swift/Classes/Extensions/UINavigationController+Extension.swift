//
//  UINavigationController+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import UIKit

extension UINavigationController {
    
    /// Making the status bar changed from the top view controller
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}

public extension UINavigationController {
    
    /// BAck to spicefic vc in the stack
    ///
    /// - Parameters:
    ///   - type: UIViewController
    ///   - animated: animated
    func backTo<T: UIViewController>(_ type: T.Type, animated: Bool = true) {
        if let vc = viewControllers.first(where: { $0 is T }) {
            popToViewController(vc, animated: animated)
        }
    }
}
