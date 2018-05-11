# Helper4Swift

[![CI Status](https://img.shields.io/travis/cs4alhaider/Helper4Swift.svg?style=flat)](https://travis-ci.org/cs4alhaider/Helper4Swift)
[![Version](https://img.shields.io/cocoapods/v/Helper4Swift.svg?style=flat)](https://cocoapods.org/pods/Helper4Swift)
[![License](https://img.shields.io/cocoapods/l/Helper4Swift.svg?style=flat)](https://cocoapods.org/pods/Helper4Swift)
[![Platform](https://img.shields.io/cocoapods/p/Helper4Swift.svg?style=flat)](https://cocoapods.org/pods/Helper4Swift)
[![Twitter: @cs_alhaider](https://img.shields.io/badge/contact-%40cs_alhaider-blue.svg)](https://twitter.com/cs_alhaider)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Xcode 9.2 , Swift 4

## Installation

Helper4Swift is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Helper4Swift'
```

## Classes folder contain :
- [Helper](#helper)

## Extensions folder contains :
  - [String Extensions](#string-extensions)
  - [UIDevice Extensions](#uidevice-extensions)
  - [UITextField Extensions](#uitextfield-extensions)
  - [UIView Extensions](#uiview-extensions)
  - [UIImageView Extensions](#uiimageview-extensions)
  - [UIColor Extensions](#uicolor-extensions)
  
<br />

### Helper
- [x] getDate method  ``` // return the current date in different format ```
- [x] formatThisNumber method  ``` // takes string numbers (e.g Arabic numbers) and return string english numbers ```
- [x] shakePhone method  ``` // all kinds of UIImpactFeedbackGenerator .light .medium etc.. ```
- [x] disabledForSome method  ``` // take control of what to show/hide for specific iOS devices ```
- [x] showBasicAlert method  ``` // showing basic alert with title and message and OK button to dissmiss ```

<br />

### Extensions

#### String Extensions 
- [x] isValidEmail  ``` // return true if the email match the regular expression (helful when adding sign up page)```
- [x] isValidNumber  ``` // return true if the number match the regular expression ```
- [x] removeWhitespace method  ``` // removing the white space form string ```

#### UIDevice Extensions
- [x] modelName  ``` // determines the current iOS device model ```

#### UITextField Extensions
- [x] addUnderlineDesign method  ``` // adds Underline Design to UITextField ```

#### UIView Extensions
- [x] addVerticalGradientLayer method  ``` // adds a vertical gradient layer with two UIColors to the UIView ```
- [x] dropShadow method  ``` // drop a shadow to the UIView ```

#### UIImageView Extensions
- [x] downloadedFrom method  ``` // downloads an image asynchronously from the web using URLSession```

#### UIColor Extensions
- [x] colorFromHexString method  ``` // return UIColor from a given hex string color```



## Author

Abdullah Alhaider, cs.alhaider@gmail.com

## License

Helper4Swift is available under the MIT license. See the LICENSE file for more info.
