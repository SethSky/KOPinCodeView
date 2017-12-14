## Overview
KOPinCodeView is a completed view developed for PIN-code entering. 

Key features and advantages:
 - easy for integrating in controller;
 - wide visual customization; 
 - automatically creates TextField and background view according to self view;
 - optional PIN-code confirmation with integrated permission control; 
 - able to set number of cells for PIN-code entering.

![KOPinCodeView](https://github.com/SethSky/KOPinCodeView/blob/master/Source/Assets/pin_code_view.gif?raw=true)
![KOPinCodeView](https://github.com/SethSky/KOPinCodeView/blob/master/Source/Assets/pin_code_view_confirm.gif?raw=true)


# KOPinCodeView
[![Version](https://img.shields.io/cocoapods/v/KOPinCodeView.svg?style=flat)](http://cocoapods.org/pods/KOPinCodeView)
[![License](https://img.shields.io/cocoapods/l/KOPinCodeView.svg?style=flat)](http://cocoapods.org/pods/KOPinCodeView)
[![Platform](https://img.shields.io/cocoapods/p/KOPinCodeView.svg?style=flat)](http://cocoapods.org/pods/KOPinCodeView)

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.1+ is required to build KOPinCodeView 0.1.0+.

To integrate KOPinCodeView into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

target '<Your Target Name>' do
pod 'KOPinCodeView', '~> 0.1.1'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage

### Swift
If you are using `use_frameworks!` in your Podfile, use this import:
```swift
import KOPinCodeView
```
### In Objective-C

```objc
#import <KOPinCodeView/KOPinCodeView.h> //in your controller's header file
```
##### Init methods
#
```objc
//init PinCodeView with cout symbol
-(void)initPinWithCountView:(int)count;

//init PinCodeView with confirm or custom view
-(void)initPinViewWithConfirmPIN:(BOOL)confirm
                     countSymbol:(int)count
                      sizeSimbol:(CGSize)size
                        formView:(FormView)form;
```
##### Delegate methods KOPinCodeViewDelegate
#
```objc
// delegate method. Called when entered all simbols.
// it returned symbols array and string with all symbols.
- (void)pinDidEnterAllSymbol:(NSArray *)symbolArray string:(NSString*)pin;
```
##### Creating a Pin Code View 
###### Example code:
#
```objc
//1. init with frame
KOPinCodeView *pinCodeView = [[KOPinCodeView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 65)];
//2. Add to you view
[self.view addSubview:pinCodeView];
//3. setting the delegate:
pinCodeView.delegate = self;
//or just add view in storyboard  
```
```objc
//and init PinCodeView with cout symbol example
[pinCodeView initPinWithCountView:4];
```
###### init PinCodeView with confirm example:
#
```objc
[self.pinCodeConfirmView initPinViewWithConfirmPIN:YES countSymbol:6 sizeSimbol:CGSizeMake(45, 45) formView:kCircle];
```

###### Pin Code View with confirm custom settings example:
#
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
KOPinCodeView is released under the MIT license. [See LICENSE](LICENSE) for details.
