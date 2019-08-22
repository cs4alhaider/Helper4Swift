//
//  UITableView+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 18/05/2019.
//

import UIKit

public extension UITableView {
    
    /// Index path of last row in tableView.
    var indexPathForLastRow: IndexPath? {
        return indexPathForLastRow(inSection: lastSection)
    }
    
    /// Index of last section in tableView.
    var lastSection: Int {
        return numberOfSections > 0 ? numberOfSections - 1 : 0
    }
}

public extension UITableView {
    
    /// Remove TableFooterView.
    func removeTableFooterView() {
        tableFooterView = nil
    }
    
    /// Remove TableHeaderView.
    func removeTableHeaderView() {
        tableHeaderView = nil
    }
    
    /// Scroll to bottom of TableView.
    ///
    /// - Parameter animated: set true to animate scroll (default is true).
    func scrollToBottom(animated: Bool = true) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: animated)
    }
    
    /// Scroll to top of TableView.
    ///
    /// - Parameter animated: set true to animate scroll (default is true).
    func scrollToTop(animated: Bool = true) {
        setContentOffset(CGPoint.zero, animated: animated)
    }
    
    /// Reload data with a completion handler.
    ///
    /// - Parameter completion: completion handler to run after reloadData finishes.
    func reloadData(_ completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { _ in
            completion()
        })
    }
    
    /// Number of all rows in all sections of tableView.
    ///
    /// - Returns: The count of all rows in the tableView.
    func numberOfRows() -> Int {
        var section = 0
        var rowCount = 0
        while section < numberOfSections {
            rowCount += numberOfRows(inSection: section)
            section += 1
        }
        return rowCount
    }
    
    /// IndexPath for last row in section.
    ///
    /// - Parameter section: section to get last row in.
    /// - Returns: optional last indexPath for last row in section (if applicable).
    func indexPathForLastRow(inSection section: Int) -> IndexPath? {
        guard section >= 0 else { return nil }
        guard numberOfRows(inSection: section) > 0  else {
            return IndexPath(row: 0, section: section)
        }
        return IndexPath(row: numberOfRows(inSection: section) - 1, section: section)
    }
    
    /// Register UITableViewCell with .xib file using only its corresponding class.
    /// Assumes that the .xib filename and cell class has the same name.
    ///
    /// - Parameters:
    ///   - name: UITableViewCell type.
    ///   - bundleClass: Class in which the Bundle instance will be based on.
    func registerNibCell<T: UITableViewCell>(nibWithCellClass name: T.Type, at bundleClass: AnyClass? = nil) {
        let identifier = String(describing: name)
        var bundle: Bundle?
        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }
        register(UINib(nibName: identifier, bundle: bundle), forCellReuseIdentifier: identifier)
    }
    
    /// Dequeue reusable UITableViewCell using class name
    ///
    /// - Parameter name: UITableViewCell type
    /// - Returns: UITableViewCell object with associated class name.
    func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: name)) as? T else {
            return T()
        }
        return cell
    }
    
    /// Dequeue reusable UITableViewCell using class name for indexPath
    ///
    /// - Parameters:
    ///   - name: UITableViewCell type.
    ///   - indexPath: location of cell in tableView.
    /// - Returns: UITableViewCell object with associated class name.
    func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as? T else {
            return T()
        }
        return cell
    }
    
    /// Check whether IndexPath is valid within the tableView
    ///
    /// - Parameter indexPath: An IndexPath to check
    /// - Returns: Boolean value for valid or invalid IndexPath
    func isValidIndexPath(_ indexPath: IndexPath) -> Bool {
        return indexPath.section < numberOfSections && indexPath.row < numberOfRows(inSection: indexPath.section)
    }
    
    /// Safely scroll to possibly invalid IndexPath
    ///
    /// - Parameters:
    ///   - indexPath: Target IndexPath to scroll to
    ///   - scrollPosition: Scroll position
    ///   - animated: Whether to animate or not
    func safeScrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        guard indexPath.section < numberOfSections else { return }
        guard indexPath.row < numberOfRows(inSection: indexPath.section) else { return }
        scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }
    
    /// Adding layers to tableView type grouped
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - cell: Cell
    ///   - indexPath: IndexPath
    func setRoundedCornersForGroupedCells(tableView: UITableView, cell: UITableViewCell, indexPath: IndexPath, color: UIColor) {
        if cell.responds(to: #selector(getter: UIView.tintColor)) {
            tableView.separatorStyle = .singleLine
            
            if cell.responds(to: #selector(getter: UIView.tintColor)) {
                let cornerRadius: CGFloat = 10.0
                if indexPath.row == 0 && indexPath.row == ( tableView.numberOfRows(inSection: indexPath.section) - 1) {
                    // Only one cell in section
                    cell.roundCorners(radius: cornerRadius)
                } else if indexPath.row == 0 {
                    // First cell in section
                    cell.roundCorners(corners: [.topLeft, .topRight], radius: cornerRadius)
                } else if indexPath.row == (tableView.numberOfRows(inSection: indexPath.section) - 1) {
                    // Last cell in section
                    cell.roundCorners(corners: [.bottomLeft, .bottomRight], radius: cornerRadius)
                } else {
                    // Middle cells
                    cell.roundCorners(radius: 0)
                }
            }
        }
    }
}
