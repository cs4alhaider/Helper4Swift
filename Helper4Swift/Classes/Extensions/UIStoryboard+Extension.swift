//
//  UIStoryboard+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import UIKit

public extension UIStoryboard {
    
    /// Instantiate a UIViewController using its class name
    ///
    /// - Parameter name: UIViewController type
    /// - Returns: The view controller corresponding to specified class name
    func instantiateVC<T: UIViewController>(withClass name: T.Type) -> T {
        return instantiateViewController(withIdentifier: String(describing: name)) as? T ?? T()
    }
}
