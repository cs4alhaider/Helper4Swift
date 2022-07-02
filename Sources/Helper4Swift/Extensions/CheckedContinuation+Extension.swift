//
//  CheckedContinuation+Extension.swift
//  
//
//  Created by Abdullah Alhaider on 02/07/2022.
//

import Foundation

public extension CheckedContinuation where T == Void {
    func resume(withErrorIfExist error: E?) {
        if let error = error {
            resume(throwing: error)
        } else {
            resume()
        }
    }
}

