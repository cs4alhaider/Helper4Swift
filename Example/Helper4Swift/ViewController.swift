//
//  ViewController.swift
//  Helper4Swift
//
//  Created by cs4alhaider on 05/11/2018.
//  Copyright (c) 2018 cs4alhaider. All rights reserved.
//

import UIKit
import Helper4Swift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Helper4Swift.getCurrentDate(format: .MMMMddYYYYWithTime))
        
        let myName = "Abdulah Alhaider"
        print(myName.isValidEmail)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

