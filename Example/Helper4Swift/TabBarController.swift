//
//  TabBarController.swift
//  Helper4Swift_Example
//
//  Created by Abdullah Alhaider on 8/25/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        // Do any additional setup after loading the view.
    }

    fileprivate func setupTabBar() {
        tabBar.barTintColor = AppColors.someColor
        tabBar.tintColor = .black
        let firstVC = creatNavController(for: FirstViewController(), iconImage: #imageLiteral(resourceName: "first"), title: "first", barTintColor: UIColor.orange, isTranslucent: false, largeTitle: true)
        let secondVC = creatNavController(for: SecondViewController(), iconImage: #imageLiteral(resourceName: "genius"))
        //tabBar.items?[0].title = "Hel"
        viewControllers = [firstVC, secondVC]
    }
}
