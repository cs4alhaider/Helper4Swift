//
//  FirstViewController.swift
//  Helper4Swift
//
//  Created by cs4alhaider on 05/11/2018.
//  Copyright (c) 2018 cs4alhaider. All rights reserved.
//

import UIKit
import Helper4Swift

class FirstViewController: UIViewController {

    let jsonURL = "https://api.coinmarketcap.com/v1/ticker/"
    let cellId = "FirstViewControllerCellID"
    var coinsArray = [String]()
    
    fileprivate lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.backgroundColor = .clear
        table.register(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
    }
    
    fileprivate func setup() {
        title = "First VC"
        view.backgroundColor = .white
        view.addVerticalGradientLayer(topColor: UIColor.orange, bottomColor: AppColors.someColor)
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }

    func fetchData(){
        H4S.fetchGenericData(urlString: jsonURL) { (coin: [Coin]) in
            self.coinsArray = []
            coin.forEach({self.coinsArray.append($0.symbol ?? "")})
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}// class

// MARK: - TableViewDelegate
extension FirstViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return coinsArray.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension FirstViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
            cell.textLabel?.text = coinsArray[indexPath.row]
            cell.detailTextLabel?.text = "test"
            cell.backgroundColor = .clear
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}
