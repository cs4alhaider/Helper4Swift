//
//  UIViewController+LocalAuthentication+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 23/08/2019.
//

import LocalAuthentication
import UIKit

public extension UIViewController {
    
    func canUseFaceTouchID(Complition: @escaping (Bool) -> Void) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Sign in using your FaceID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, _ in
                
                DispatchQueue.main.async {
                    if success {
                        Complition(true)
                    } else {
                        // error
                        Complition(false)
                    }
                }
            }
        } else {
            // no biometry
            Complition(false)
        }
    }
}
