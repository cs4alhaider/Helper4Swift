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

    
    let myName = "abc@gmail.com"
    let jsonURL = "https://api.coinmarketcap.com/v1/ticker/"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        print(Helper4Swift.getCurrentDate(format: .MMMMddYYYYWithTime))
        print(myName.isValidEmail)
    }

    
    func fetchData(){
        Helper4Swift.fetchGenericData(urlString: jsonURL) { (coin: [Coin]) in
            coin.forEach({print($0.symbol!)})
        }
    }
    
}// class

