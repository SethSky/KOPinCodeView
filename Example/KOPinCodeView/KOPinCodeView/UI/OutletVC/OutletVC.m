//
//  OutletVC.m
//  KOPinCodeView
//
//  Created by Oleksandr Khymych on 14.12.2017.
//  Copyright © 2017 Oleksandr Khymych. All rights reserved.
//

#import "OutletVC.h"

@interface OutletVC () <KOPinCodeViewDelegate>
@property (weak, nonatomic) IBOutlet KOPinCodeView *pinCodeView;
@end

@implementation OutletVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //PinCodeView with cout symbol example  
    [_pinCodeView initPinWithCountView:6];
}
#pragma mark - KOPinCodeViewDelegate
- (void)pinDidEnterAllSymbol:(NSArray *)symbolArray string:(NSString*)pin{
    NSLog(@"Pin:%@", pin);
}
@end
