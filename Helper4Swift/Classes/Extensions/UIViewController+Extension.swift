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
    func setBackButtonTitle(_ stringToUse: String){
        let titleToSet = stringToUse
        let bacButton = UIBarButtonItem(title: titleToSet, style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = bacButton
    }
    
    
    /// shows an alert with title, message and one button
    ///
    /// - Parameters:
    ///   - title: title to set
    ///   - message: message to set
    ///   - buttonTitle: button title to set
    ///   - buttonHandler: completion handler for the button
    func showOneActionAlert(title: String?, message: String?, buttonTitle: String?, buttonHandler: (() -> ())?) {
        guard let _ = buttonTitle else { return }
        guard title != nil || message != nil else { return }
        let alert = UIAlertController(title: title ?? "", message: message ?? "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle!, style: .default) { _ in
            buttonHandler?()
        })
        present(alert, animated: true, completion: nil)
    }
    
    
    /// shows an alert with title, message and two buttons
    ///
    /// - Parameters:
    ///   - title: title to set
    ///   - message: message to set
    ///   - btn1Title: button 1 title to set
    ///   - btn2Title: button 2 title to set
    ///   - btn1Handler: completion handler for the first button
    func showTwoActionsAlert(title: String?, message: String?, btn1Title: String?, btn2Title: String?, btn1Handler: (() -> ())?) {
        guard let _ = btn1Title, let _ = btn2Title else { return }
        guard title != nil || message != nil else { return }
        let alert = UIAlertController(title: title ?? "", message: message ?? "", preferredStyle: .alert)
        let action1 = UIAlertAction(title: btn1Title!, style: .default) { _ in
            btn1Handler?()
        }
        let action2 = UIAlertAction(title: btn2Title!, style: .default)
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
}
