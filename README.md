# KOPinCodeView

[![CI Status](http://img.shields.io/travis/Oleksandr Khymych/KOPinCodeView.svg?style=flat)](https://travis-ci.org/Oleksandr Khymych/KOPinCodeView)
[![Version](https://img.shields.io/cocoapods/v/KOPinCodeView.svg?style=flat)](http://cocoapods.org/pods/KOPinCodeView)
[![License](https://img.shields.io/cocoapods/l/KOPinCodeView.svg?style=flat)](http://cocoapods.org/pods/KOPinCodeView)
[![Platform](https://img.shields.io/cocoapods/p/KOPinCodeView.svg?style=flat)](http://cocoapods.org/pods/KOPinCodeView)

## Setup with CocoaPods
* Add ```pod 'KOPinCodeView'``` to your Podfile
* Run ```pod install```
* Run ```open App.xcworkspace```

### Objective-C
```objc 
#import <KOPinCodeView/KOPinCodeView.h> //in your controller's header file
``` 

### Swift
If you are using `use_frameworks!` in your Podfile, use this import:
```swift
import KOPinCodeView
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

KOPinCodeView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "KOPinCodeView"
```
## Usage
### In Objective-C
Example code:
```objc
KOPinCodeView *pinCodeView = [[KOPinCodeView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 65)];
[self.view addSubview:pinCodeView];
[pinCodeView initPinWithCountView:4];
```

Pin Code View with cout symbol custom settings example:
```objc
pinCodeView.formPinView = kFoursquare;
```
Pin Code View with confirm custom settings example:
```objc
//thickness view line
self.pinCodeConfirmView.lineDeep = 2.f;
//Color view line
self.pinCodeConfirmView.lineColor = kColor;
//Background color view in select state
self.pinCodeConfirmView.selectColor = [kColor colorWithAlphaComponent:0.5f];

//Text color UITextField
self.pinCodeConfirmView.symbolColor = kColor;
//Font UITextField
self.pinCodeConfirmView.symbolFont = [UIFont systemFontOfSize:14];

//UILabel show only initPinViewWithConfirmPIN:
//Text color Label
self.pinCodeConfirmView.titleColor = kColor;
//Font Label
self.pinCodeConfirmView.titleFont = [UIFont systemFontOfSize:14];
//Text Label - Default: "enter Pin code"
self.pinCodeConfirmView.enterPinString = @"Any text 1";
//Text Label - Default: "Confirm Pin code"
self.pinCodeConfirmView.confirmPinString = @"Any text 2";

//Create Confirm Pin Code
self.pinCodeConfirmView.confirm = NO;
//Secure Text - Default: YES
self.pinCodeConfirmView.secure = NO;
//Keyboard Type
self.pinCodeConfirmView.typeKeyboard = UIKeyboardTypeNumberPad;
```
## Author

Oleksandr Khymych, seth@khymych.com

## License
KOPinCodeView is available under the MIT license. See the LICENSE file for more info.