//
//  UIImageView+Extension.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 5/11/18.
//

import UIKit

/*
 - You can use this extension to download an image or you can use popular third party libraries like :
 - https://github.com/rs/SDWebImage --> Categories for UIImageView, UIButton, MKAnnotationView and it provide asynchronous image downloader with cache support and writin by Objective-C
 - https://github.com/onevcat/Kingfisher --> also it provide image downloader with cache support and writing by Swift
 */

public extension UIImageView {
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    public func downloadedFrom(url: URL, contentMode mode: UIViewContentMode) {
        contentMode = mode
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    
    
    public func downloadedFrom(link: String, contentMode: UIViewContentMode) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: contentMode)
    }
    
    /*
     - Usage:
     - imageView.downloadedFrom(link: "https://cn.pling.com/img/b/7/1/7/e105204712dfa5ed2b3f17254d561ce261fd.jpg", contentMode: .scaleAspectFill)
     */
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    public func applyImageDesgin(clipsToBounds: Bool,
                                 cornerRadius: CGFloat,
                                 borderWidth: CGFloat,
                                 borderColor: UIColor) {
        
        self.clipsToBounds = clipsToBounds // true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
}// extension end.
