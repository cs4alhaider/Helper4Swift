//
//  UIApplication+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

#if !os(macOS)
import UIKit

public extension UIApplication {
    
    /// Getting the key window that is currently active
    /// - Returns: The key UIWindow for the application
    @available(iOS 13.0, *)
    class var keyWindowScene: UIWindow? {
        return UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
    
    /// Getting the top controller
    ///
    /// - Parameter controller: UIViewController
    /// - Returns: the top viewController currently displayed
    class func topViewController(controller: UIViewController? = nil) -> UIViewController? {
        let rootController: UIViewController?
        
        if let controller = controller {
            rootController = controller
        } else {
            if #available(iOS 13.0, *) {
                rootController = keyWindowScene?.rootViewController
            } else {
                rootController = UIApplication.shared.keyWindow?.rootViewController
            }
        }
        
        if let navigationController = rootController as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = rootController as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = rootController?.presentedViewController {
            return topViewController(controller: presented)
        }
        return rootController
    }
}

#endif
