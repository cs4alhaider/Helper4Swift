//
//  SecondViewController.swift
//  Helper4Swift_Example
//
//  Created by Abdullah Alhaider on 8/25/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import Helper4Swift

class SecondViewController: UIViewController {

    let example1 = "   " // only spaces
    let example2 = "text"
    let examole3 = "" //empty and no white spaces
    let myName = "abc@gmail.com"
    
    fileprivate lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        view.alpha = 1
        view.layer.roundCorners(corners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    fileprivate lazy var myButton: UIButton = {
        let buttton = UIButton()
        buttton.setTitle("PRESS ME!", for: .normal)
        buttton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 19)
        buttton.setTitleColor(.white, for: .normal)
        buttton.backgroundColor = .gray
        buttton.clipsToBounds = true
        buttton.layer.cornerRadius = 3
        buttton.translatesAutoresizingMaskIntoConstraints = false
        buttton.addTarget(self, action: #selector(myButtonAction(_:)), for: .touchUpInside)
        return buttton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        testText()
    }
    
    @objc fileprivate func myButtonAction(_ sender: UIButton) {
        if #available(iOS 10.0, *) {
            H4S.feedbackGenerator(type: .success)
        }
    }
    
    fileprivate func testText() {
        print("myName isValidEmail: \(myName.isValidEmail)")
        print("===========================")
        print("example1 isEmptyAtAll: \(example1.isEmptyAtAll)")
        print("example1 isEmpty: \(example1.isEmpty)")
        print("example1 isWhiteSpaceOnly: \(example1.isWhiteSpaceOnly)")
        print("===========================")
        print("example2 isEmptyAtAll: \(example2.isEmptyAtAll)")
        print("example2 isEmpty: \(example2.isEmpty)")
        print("example2 isWhiteSpaceOnly: \(example2.isWhiteSpaceOnly)")
        print("===========================")
        print("examole3 isEmptyAtAll: \(examole3.isEmptyAtAll)")
        print("examole3 isEmpty: \(examole3.isEmpty)")
        print("examole3 isWhiteSpaceOnly: \(examole3.isWhiteSpaceOnly)")
    }
    
    fileprivate func setup() {
        //edgesForExtendedLayout = []
        edgesForExtendedLayout = UIRectEdge()
        //extendedLayoutIncludesOpaqueBars = false
        //automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = .white
        title = "Second VC"
        view.addSubview(backView)
        //backView.anchorWithDimensions(height: 400, width: 320, centerX: view.centerXAnchor, centerY: view.centerYAnchor, centerXConstant: 0, centerYConstant: 0)
//        backView.anchorWithMultiplier(height: view.heightAnchor,
//                                      width: view.widthAnchor,
//                                      heightMultiplier: 0.65,
//                                      widthMultiplier: 0.5,
//                                      centerX: view.centerXAnchor,
//                                      centerY: view.centerYAnchor,
//                                      centerXConstant: 0,
//                                      centerYConstant: 20)
        backView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 15, leftConstant: 15, bottomConstant: 15, rightConstant: 15)
        
        backView.addSubview(myButton)
        myButton.anchorWithDimensions(height: 70, width: 200, centerX: backView.centerXAnchor)
        myButton.anchor(bottom: backView.bottomAnchor, bottomConstant: 15)
        if #available(iOS 11.0, *) {
            myButton.layer.cornerRadius = 15
            myButton.layer.maskedCorners = [.layerMaxXMaxYCorner]
        } else {
            // Fallback on earlier versions
        }
    }
    
}
