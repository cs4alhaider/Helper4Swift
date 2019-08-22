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
    
    /// making the nav bar with gradient image
    func updateImageWithGradient(colors: [CGColor]) {
        
        let navBarHeight = navigationBar.frame.size.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let heightAdjustment: CGFloat = 2
        let gradientHeight = navBarHeight + statusBarHeight + heightAdjustment
        
        let bgImage = imageWithGradient(colors: colors,
                                        size: CGSize(width: UIScreen.main.bounds.size.width,
                                                     height: gradientHeight))
        guard let image = bgImage else { return }
        navigationBar.barTintColor = UIColor(patternImage: image)
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
