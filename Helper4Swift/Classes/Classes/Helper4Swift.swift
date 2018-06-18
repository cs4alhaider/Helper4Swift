//
//  Helper4Swift.swift
//  Helper4Swift
//
//  Created by Abdullah Alhaider on 5/11/18.
//  https://developer.apple.com/library/content/documentation/Xcode/Reference/xcode_markup_formatting_ref/

import Foundation
import UIKit

public class Helper4Swift {
    
    
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    /**
     Fetching json data by passing the struct/class model and the urlString. "Good Solution to Eliminate Code Duplication!"
     - Author: Abdullah Alhaider
     */
    
    public static func fetchGenericData<Model: Decodable>(urlString: String, completion: @escaping (Model) -> ()) {
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in
            guard let data = data else { return }
            do {
                let object = try JSONDecoder().decode(Model.self, from: data)
                completion(object)
            } catch let jsonErr {
                print("Faild to decode json data : \(jsonErr)")
            }
        }.resume()
    }
    
    
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    public enum dateFormat: String {
        case MMMMddYYYYWithTime = "MMMM dd, yyyy 'at' h:mm a"
        case ddmmyyyyWithTime = "dd/MM/yyyy 'at' h:mm a"
        /*
         - You can add as many format as you want
         - and if you not familiar with other date format you can use this website
         - to pick your best format http://nsdateformatter.com
         */
    }
    
    public static func getCurrentDate(format: dateFormat) -> String {
        
        let theDate = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = format.rawValue // from enum dateFormat
        let formatedDate = formatter.string(from:theDate)
        
        return formatedDate
    }
    
    
    public static func getCurrentDateWithThisFormat(formatToUse: String) -> String {
        
        let theDate = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = formatToUse
        let formatedDate = formatter.string(from:theDate)
        
        return formatedDate
    }
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    
    /**
     This method is to format numbers like Arabic numbers to EN numbers and so on with other languages ..
     - Author: Abdullah Alhaider
     */
    public static func formatThisNumber(stringNumber: String) -> String {
        
        let ourString: String = stringNumber
        let ourFormatter: NumberFormatter = NumberFormatter()
        ourFormatter.locale = NSLocale(localeIdentifier: "EN") as Locale?
        let ourFinal = ourFormatter.number(from: ourString)
        print(ourFinal!)
        let ourStringNumber = "\(Int(truncating: ourFinal!))"
        
        return ourStringNumber
    }
    
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    
    public enum shakingType {
        
        case light
        case medium
        case heavy
        case success
        case warning
        case error
    }
    
    
    @available(iOS 10.0, *)
    public static func shakePhone(style: shakingType){
        
        if style == .light {
            let lightGenerator = UIImpactFeedbackGenerator(style: .light)
            lightGenerator.impactOccurred()
        }
        
        if style == .medium {
            let mediumGenerator = UIImpactFeedbackGenerator(style: .medium)
            mediumGenerator.impactOccurred()
        }
        
        if style == .heavy {
            let heavyGenerator = UIImpactFeedbackGenerator(style: .heavy)
            heavyGenerator.impactOccurred()
        }
        
        if style == .success {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        }
        
        if style == .warning {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)
        }
        
        if style == .error {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        }
        
    }
    
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    
    
    // This method require UIDevice+Extension.swift
    public static func disabledForSome(){
        
        let device = UIDevice.current.modelName
        
        if  device == "Simulator" ||
            device == "iPad 2" ||
            device == "iPad 3" ||
            device == "iPad 4" ||
            device == "iPad Air" ||
            device == "iPad Air 2" ||
            device == "iPad 5" ||
            device == "iPad Mini" ||
            device == "iPad Mini 2" ||
            device == "iPad Mini 3" ||
            device == "iPad Mini 4" ||
            device == "iPad Pro 9.7 Inch" ||
            device == "iPad Pro 12.9 Inch" ||
            device == "iPad Pro 12.9 Inch 2. Generation" ||
            device == "iPad Pro 10.5 Inch" {
            
            //Do something here like button.isHidden = true ...
        }
    }
    
    
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    
    
    @objc func dismissKeyboard(thisView: UIView){
        thisView.endEditing(true)
    }
    
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    
    func toolBar(buttonTitle: String, textField: UITextField){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let done = UIBarButtonItem(title: buttonTitle, style: .done, target: nil, action: #selector(Helper4Swift.dismissKeyboard))
        toolbar.setItems([done], animated: true)
        
        textField.inputAccessoryView = toolbar
    }
    
    
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    /* -------------------------------------------------------------------------------- */
    
    
    public static func showBasicAlert(title: String?, message: String?, buttonTitle: String?, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
    
    
    
    /****************************************************************************************************/
    /****************************************************************************************************/
    
    
    
    
}// Class ends.
