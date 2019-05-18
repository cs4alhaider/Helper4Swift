# Helper4Swift

[![Version](https://img.shields.io/cocoapods/v/Helper4Swift.svg?style=flat)](https://cocoapods.org/pods/Helper4Swift)
[![License](https://img.shields.io/cocoapods/l/Helper4Swift.svg?style=flat)](https://cocoapods.org/pods/Helper4Swift)
[![Platform](https://img.shields.io/cocoapods/p/Helper4Swift.svg?style=flat)](https://cocoapods.org/pods/Helper4Swift)
[![Twitter: @cs_alhaider](https://img.shields.io/badge/contact-%40cs_alhaider-blue.svg)](https://twitter.com/cs_alhaider)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

Xcode 10* , Swift 5

## Installation

Helper4Swift is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Helper4Swift'
```

## Classes folder contain :
- [Helper4Swift](#helper4swift)

## Extensions folder contains :
  - [String Extension](#string-extension)
  - [Array Extension](#array-extension)
  - [UIButton Extension](#uibutton-extension)
  - [UILabel Extension](#uilabel-extension)
  - [UIDevice Extension](#uidevice-extension)
  - [UITextField Extension](#uitextfield-extension)
  - [UIView Extension](#uiview-extension)
  - [UIImageView Extension](#uiimageview-extension)
  - [UIColor Extension](#uicolor-extension)
  - [UITabBarController Extension](#uitabbarcontroller-extension)
  - [UIViewController Extension](#uiviewcontroller-extension)

  
  
<br />

### Helper4Swift

- [x] fetchGenericData method  ``` // fetching json data by passing the struct/class model and the url ```
- [x] getCurrentDate method  ``` // return the current date in different format ```
- [x] getCurrentDateWithThisFormat method  ``` // return the current date with specific format ```
- [x] formatThisNumber method  ``` // takes string numbers (e.g Arabic numbers) and return string english numbers ```
- [x] shakePhone method  ``` // all kinds of UIImpactFeedbackGenerator .light .medium etc.. ```
- [x] disabledForSome method  ``` // take control of what to show/hide for specific iOS devices ```
- [x] toolBar method  ``` // adding toolbar to a textField ```
- [x] showBasicAlert method  ``` // showing basic alert with title and message and OK button to dissmiss ```

<br />

### Extensions

#### String Extension 
- [x] isValidEmail  ``` // return true if the email match the regular expression (helful when adding sign up page)```
- [x] isValidNumber  ``` // return true if the number match the regular expression ```
- [x] isValidPassword  ``` // return true if the string has minimum 8 characters, and at least one uppercase letter, and one lowercase letter and one number ```
- [x] isValidUrl  ``` // return true if string is valid Url ```
- [x] removeWhitespace method  ``` // removing the white space form string ```
- [x] replaceString  ``` // Replacing string by another string ```

#### Array Extension
- [x] shuffle method  ``` // returns an array containing this sequence shuffled```

#### UIButton Extension
- [x] applyButtonDesign method  ``` // adding a shadow and other design ```

#### UILabel Extension
- [x] setLineSpacing method  ``` // adding a space between the lines ```

#### UIDevice Extension
- [x] modelName  ``` // determines the current iOS device model ```

#### UITextField Extension
- [x] addUnderlineDesign method  ``` // adding underline Design to UITextField ```

#### UIView Extension
- [x] addVerticalGradientLayer method  ``` // adds a vertical gradient layer with two UIColors to the UIView ```
- [x] applyViewDesign method  ``` // like drop a shadow to the UIView ```

#### UIImageView Extension
- [x] downloadedFrom method  ``` // downloads an image asynchronously from the web using URLSession```

#### UIColor Extension
- [x] colorFromHexString method  ``` // return UIColor from a given hex string color```

#### UITabBarController Extension

#### UIViewController Extension



## Author

Abdullah Alhaider, 
<br />
cs.alhaider@gmail.com
<br />
[Twitter](https://twitter.com/cs_alhaider)

## License

Helper4Swift is available under the MIT license. See the LICENSE file for more info.
