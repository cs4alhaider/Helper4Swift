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
    func creatNavController(for vc: UIViewController,
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
    
    /// Creating View controller with a navigation controller
    ///
    /// - Parameters:
    ///   - navigationController: Any UINavigationController
    ///   - viewController: Any UIViewController
    ///   - selectedImage: The selected image
    ///   - unselectedImage: The unselected image
    ///   - title: Tab bar title
    /// - Returns: UINavigationController with all
    func createViewController<T: UINavigationController>(nv navigationController: T,
                                                         vc viewController: UIViewController,
                                                         selectedImage: UIImage,
                                                         unselectedImage: UIImage,
                                                         title: String?) -> T {
        let vc = viewController
        vc.tabBarItem.selectedImage = selectedImage
        vc.tabBarItem.image = unselectedImage
        vc.title = title
        
        return T(rootViewController: vc)
    }
    
    /// making the tab bar with gradient image
    func updateImageWithGradient(colors: [CGColor]) {
        
        let navBarHeight = tabBar.frame.size.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let heightAdjustment: CGFloat = 2
        let gradientHeight = navBarHeight + statusBarHeight + heightAdjustment
        
        let bgImage = imageWithGradient(colors: colors,
                                        size: CGSize(width: UIScreen.main.bounds.size.width,
                                                     height: gradientHeight))
        guard let image = bgImage else { return }
        tabBar.barTintColor = UIColor(patternImage: image)
    }
    
    /// Create an UIImage
    ///
    /// - Parameters:
    ///   - colors: Array of gradient colors
    ///   - size: CGSize
    /// - Returns: UIImage?
    private func imageWithGradient(colors: [CGColor],
                                   size: CGSize, locations: [NSNumber] = [0, 1],
                                   startPoint: CGPoint = CGPoint(x: 0.25, y: 0.5),
                                   endPoint: CGPoint = CGPoint(x: 0.75, y: 0.5),
                                   transform: CATransform3D = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))) -> UIImage? {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        gradientLayer.bounds = view.bounds.insetBy(dx: -0.5 * size.width, dy: -0.5 * size.height)
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.position = self.view.center
        gradientLayer.transform = transform
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

