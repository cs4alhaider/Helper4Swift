//
//  UIViewController+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 8/26/18.
//

import UIKit

public extension UIViewController {
    var backgroundColor: UIColor? {
        get {
            return view.backgroundColor
        }
        set {
            view.backgroundColor = newValue
        }
    }
}

public extension UIViewController {
    
    /// changing the back bar button title and color for subViewControllers
    ///
    /// - Parameter stringToUse: back bar button title
    ///
    /// - Author: Abdullah Alhaider.
    func setBackButtonTitle(_ stringToUse: String){
        let titleToSet = stringToUse
        let bacButton = UIBarButtonItem(title: titleToSet, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = bacButton
    }
    
    /// Show any viewController as a root
    ///
    /// - Parameters:
    ///   - flag: animation flag
    ///   - completion: completion
    ///
    /// - Author: Abdullah Alhaider.
    func show(animated flag: Bool, completion: (() -> Void)? = nil) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController()
        window.windowLevel = UIWindow.Level.alert
        window.makeKeyAndVisible()
        window.tintColor = .red
        window.rootViewController?.present(self, animated: flag, completion: completion)
    }
    
    /// Setting the navigation title and tab bar title
    ///
    /// - Parameters:
    ///   - navigationTitle: Navigation title
    ///   - tabBarTitle: TabBar title
    /// - Author: Abdullah Alhaider.
    func setTitles(navigationTitle: String? = nil, tabBarTitle: String? = nil) {
        // Order is important here!
        if let tabBarTitle = tabBarTitle {
            title = tabBarTitle
        }
        if let navigationTitle = navigationTitle {
            navigationItem.title = navigationTitle
        }
    }
    
    /// Setting the backBarButtonItem for the next screen to "" to hide it.
    ///
    /// - Author: Abdullah Alhaider.
    func hideBackButtonTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    /// Removing the shadow image from the navigationBar
    ///
    /// - Author: Abdullah Alhaider.
    func hideShadowImageFromNavigation() {
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    /// Adding a tap gesture recognizer to hide the keyboard
    ///
    /// - Author: Abdullah Alhaider.
    func addKeyboardHidingGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    /// selector method for addKeyboardHidingGesture()
    /// - Author: Abdullah Alhaider.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    /// Instantiate a UIViewController using its storyboard and class name
    ///
    /// - Parameters:
    ///   - name: UIViewController type
    ///   - storyboard: UIStoryboard
    /// - Returns: The view controller corresponding to specified class name
    ///
    /// - Author: Abdullah Alhaider.
    func viewControllerFromStoryboard<T: UIViewController>(withClass name: T.Type, from storyboard: UIStoryboard) -> T {
        return storyboard.instantiateViewController(withClass: name.self) 
    }
    
    /// Presents a view controller modally.
    func presentVC(_ vc: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(vc, animated: animated, completion: completion)
    }
    
    /// Pushes a view controller onto the receiver’s stack and updates the display.
    func pushVC(_ vc: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(vc, animated: animated)
    }
    
    /// Dismisses the view controller that was presented modally by the view controller.
    func dismissVC(animated: Bool = true, completion: (() -> Void)? = nil) {
        dismiss(animated: animated, completion: completion)
    }
    
    /// Pops the top view controller from the navigation stack and updates the display.
    func pop(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    /// Pops all the view controllers on the stack except the root view controller and updates the display.
    func popToRoot(animated: Bool = true) {
        navigationController?.popToRootViewController(animated: animated)
    }
    
    /// Animating dictionary of constrints
    ///
    /// - Parameters:
    ///   - constraints: NSLayoutConstraint and CGFloat
    ///   - duration: TimeInterval for the animation, default is 0.3
    ///
    /// - Author: Abdullah Alhaider.
    func animateConstrints(constraints: [NSLayoutConstraint: CGFloat], duration: TimeInterval = 0.3) {
        UIView.animate(withDuration: duration) {
            for (constraint, value) in constraints {
                constraint.constant = value
            }
            self.view.layoutIfNeeded()
        }
    }
}
