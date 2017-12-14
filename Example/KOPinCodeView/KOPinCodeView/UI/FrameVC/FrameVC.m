//
//  FrameVC.m
//  KOPinCodeView
//
//  Created by Oleksandr Khymych on 14.12.2017.
//  Copyright © 2017 Oleksandr Khymych. All rights reserved.
//

#import "FrameVC.h"
#import <KOPinCodeView/KOPinCodeView.h>

@interface FrameVC () <KOPinCodeViewDelegate>

@end

@implementation FrameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //1. init with frame
    KOPinCodeView *pinCodeView = [[KOPinCodeView alloc]initWithFrame:CGRectMake(16, 100, self.view.frame.size.width-32, 365)];
    pinCodeView.backgroundColor = [UIColor greenColor];
    //2. Add to you view
    [self.view addSubview:pinCodeView];
    pinCodeView.confirm = YES;
    //3. setting the delegate:
    pinCodeView.delegate = self;
    //and init PinCodeView with cout symbol example
    [pinCodeView initPinWithCountView:6];
}
#pragma mark - KOPinCodeViewDelegate
- (void)pinDidEnterAllSymbol:(NSArray *)symbolArray string:(NSString*)pin{
    NSLog(@"Pin:%@", pin);
}
@end
