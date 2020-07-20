//
//  UIViewFromNib.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 23/08/2019.
//

#if canImport(UIKit)
import UIKit

public class UIViewFromNib: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        addSubviewFromNib()
        setupViews()
    }
    
    /// Add your custom code here, no need to call super.
    public func setupViews() { }
}
#endif
