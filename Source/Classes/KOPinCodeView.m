//
//  KOPinCodeView.m
//  KOPinCodeView
//
//  Created by Oleksandr Khymych on 01.07.16.
//  Copyright © 2016 Oleksandr Khymych. All rights reserved.
//

#import "KOPinCodeView.h"

@interface KOPinCodeView()<UITextFieldDelegate>{
    //--------------------------------|
    // - Style property
    //--------------------------------|
    FormView        formView;
    float           borderWidth;
    UIColor*        borderColor;
    UIColor*        textColor;
    UIColor*        backgroundSelectColor;
    UIColor*        errorColor;
    UIFont*         textFont;
    
    UIKeyboardType  keyboardType;
    //--------------------------------|
    // - Text titles
    //--------------------------------|
    NSString*  enterPinText;
    NSString*  confirmPinText;
    //--------------------------------|
    // - Style titles
    //--------------------------------|
    UIColor *labelColor;
    UIFont  *labelFont;
    
    float labelHeight;
    //--------------------------------|
    // -
    //--------------------------------|
    UIView *selectView;
    UIView *deselectView;
    
    int selectIndex;
    BOOL confirmPin;
    BOOL secureText;
    
    int pinCount;
    //--------------------------------|
    // -
    //--------------------------------|
    NSMutableArray *textFieldArray;
}

@end

typedef void (^KOPinCodeViewCallback)(void);

@implementation KOPinCodeView{
    KOPinCodeViewCallback callback;
}
#pragma mark - Setters
/**
 Set form Cell
 
 @param formPinView FormView
 */
-(void)setFormPinView:(FormView)formPinView{
    formView = formPinView;
}
/**
 Set deep line
 
 @param lineDeep float
 */
-(void)setLineDeep:(float)lineDeep{
    borderWidth = lineDeep;
}

-(void)setLineColor:(UIColor *)lineColor{
    borderColor = lineColor;
}

-(void)setSelectColor:(UIColor *)selectColor{
    backgroundSelectColor = selectColor;
}

-(void)setSymbolColor:(UIColor *)symbolColor{
    textColor = symbolColor;
}

-(void)setNotMatchColor:(UIColor *)notMatchColor{
    errorColor = notMatchColor;
}

-(void)setSymbolFont:(UIFont *)symbolFont{
    textFont = symbolFont;
}

-(void)setTitleColor:(UIColor *)titleColor{
    labelColor = titleColor;
}

-(void)setTitleFont:(UIFont *)titleFont{
    labelFont = titleFont;
}

-(void)setEnterPinString:(NSString *)enterPinString{
    enterPinText = enterPinString;
}

-(void)setConfirmPinString:(NSString *)confirmPinString{
    confirmPinText = confirmPinString;
}

-(void)setConfirm:(BOOL)confirm{
    confirmPin = confirm;
}

-(void)setSecure:(BOOL)secure{
    secureText = secure;
}

-(void)setTypeKeyboard:(UIKeyboardType)typeKeyboard{
    keyboardType = typeKeyboard;
}

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadDefaultSettings];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self loadDefaultSettings];
    }
    return self;
}

#pragma mark - Load Default Settings

-(void)loadDefaultSettings{
    //------------------|
    //---UIView---------|
    //------------------|
    formView                = kCircle;
    //Border View
    borderWidth             =   1.0;
    //Color Border View
    borderColor             =  [UIColor blackColor];
    //Color BackGround View in state Selection
    backgroundSelectColor   =  [[UIColor blackColor] colorWithAlphaComponent:0.5];
    //Background View Color in error state
    errorColor              = [UIColor redColor];
    //------------------|
    //---UITextField----|
    //------------------|
    //Color UITextField
    textColor               =  [UIColor blackColor];
    //Font UITextField
    textFont                =  [UIFont systemFontOfSize:14];
    //------------------|
    //---Label----------|
    //------------------|
    //Label font
    labelFont               = [UIFont systemFontOfSize:14];
    //Label Color
    labelColor              = [UIColor blackColor];
    //Label Text
    enterPinText            = NSLocalizedString(@"enter Pin code",   @"");
    confirmPinText          = NSLocalizedString(@"Confirm Pin code", @"");
    //------------------|
    //---Other Setting--|
    //------------------|
    //Create Confirm Pin Code
    confirmPin              =   NO;
    //secure Text
    secureText              =   YES;
    //Keyboard Type
    keyboardType            = UIKeyboardTypeNumberPad;
}
#pragma mark - init Views and Text cell
/**
 init Pin code view for IBOutlet
 
 @param count int
 */
-(void)initPinWithCountView:(int)count{
    [self layoutIfNeeded];
    float width = (self.bounds.size.width/1.138)/count;
    if (width>self.bounds.size.height) {
        width = self.bounds.size.height;
    }
    textFont                =  [UIFont systemFontOfSize:width/2];
    
    [self initPinViewWithConfirmPIN:confirmPin
                        countSymbol:count
                         sizeSimbol:CGSizeMake(width, width)
                           formView:formView];
}
/**
 init Pin code view with confirm
 
 @param confirm BOOL
 @param count int
 @param size CGSize
 @param form FormView
 */
-(void)initPinViewWithConfirmPIN:(BOOL)confirm
                     countSymbol:(int)count
                      sizeSimbol:(CGSize)size
                        formView:(FormView)form{
    //Remove view
    [self removeView];
    //Update property
    pinCount = count;
    confirmPin = confirm;
    labelHeight = size.height;
    //Space between cells
    float spaceBetweenCells =  size.width/6;
    //full width
    float fullWidth = (size.width*count)+(spaceBetweenCells*(count-1));
    //full Height
    float fullHeight =  confirm ? (size.height+labelHeight)*2 : size.height;
    //count cell
    count =  confirm ? count*2 : count;
    //init textFieldArray
    textFieldArray = [NSMutableArray array];
    int b = 0;
    for (int i = 0; i< count; i++) {
        float x = 0.0;
        float y = (self.frame.size.height - fullHeight)/2;
        if (confirm) {
            if (i>count/2) b++;
            if  (i<count/2){
                x = (i == 0) ? (self.frame.size.width - fullWidth)/2 :(self.frame.size.width - fullWidth)/2 + (spaceBetweenCells + size.width)*i;
            }else{
                x = (i == 0) ? (self.frame.size.width - fullWidth)/2 :(self.frame.size.width - fullWidth)/2 + (spaceBetweenCells + size.width)*b;
            }
            y = (i<count/2) ?  y+labelHeight : y + (size.height*2+labelHeight);
        }else{
            x = (i == 0) ? (self.frame.size.width - fullWidth)/2 :(self.frame.size.width - fullWidth)/2 + (spaceBetweenCells + size.width)*i;
        }
        //create Cell
        [self createCellWithFrame:CGRectMake(x, y, size.width, size.height) and:form andIndex:i];
    }
    if (confirm) {
        CGRect rect = CGRectMake(0, (self.frame.size.height - fullHeight)/2, self.bounds.size.width, labelHeight);
        [self createConfirmTitleWithFrame:rect];
    }
}
#pragma mark - Create Cells
/**
 Create Cell with frame, form and index
 
 @param frame CGRect
 @param form FormView
 @param index int
 */
-(void)createCellWithFrame:(CGRect)frame and:(FormView)form andIndex:(int)index{
    UIView *view;
    if (!view) {
        view  = [[UIView alloc]initWithFrame:frame];
        view.tag = 100+index;
        view.layer.borderWidth  = (form == kNone)? 0 : borderWidth;
        view.layer.borderColor  = (form == kNone)? [borderColor colorWithAlphaComponent:0.0].CGColor : borderColor.CGColor;
        view.layer.cornerRadius = (form == kCircle)? frame.size.width/2 : 0 ;
        view.backgroundColor = [backgroundSelectColor colorWithAlphaComponent:0.0];
        
        [self addSubview:view];
    }
    UITextField *textField;
    if (!textField) {
        textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        textField.tag  = 100+index;
        textField.textAlignment = NSTextAlignmentCenter;
        textField.textColor = textColor;
        [textField setFont:textFont];
        textField.keyboardType = UIKeyboardTypeNumberPad;
        [textField setTintColor:[UIColor clearColor]];
        textField.delegate = self;
        [view addSubview:textField];
        [textFieldArray addObject:textField];
    }
}

/**
 Remove all view and label from super view
 */
-(void)removeView{
    for (UIView *view in [self subviews]){
        [view removeFromSuperview];
    }
    for (UITextField *textField in [self subviews]){
        [textField removeFromSuperview];
    }
}

#pragma mark - Create Labels
/**
 Create confirm Title with frame
 
 @param frame CGRect
 */
- (void)createConfirmTitleWithFrame:(CGRect)frame{
    UILabel *pinTitleLabel;
    if (!pinTitleLabel) {
        pinTitleLabel = [[UILabel alloc]initWithFrame:frame];
        pinTitleLabel.textAlignment = NSTextAlignmentCenter;
        pinTitleLabel.font = textFont;
        pinTitleLabel.text = enterPinText;
        [pinTitleLabel setTextColor:labelColor];
        [self addSubview: pinTitleLabel];
    }
    UILabel *confirmPinTitleLabel;
    if (!confirmPinTitleLabel) {
        confirmPinTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y + frame.size.height*2, frame.size.width, frame.size.height)];
        confirmPinTitleLabel.textAlignment = NSTextAlignmentCenter;
        confirmPinTitleLabel.font = textFont;
        confirmPinTitleLabel.text = confirmPinText;
        [confirmPinTitleLabel setTextColor:labelColor];
        [self addSubview: confirmPinTitleLabel];
    }
}
/**
 Actions
 */
-(void)actions{
    [self endEditing:YES];
    NSMutableArray *errorArray =[NSMutableArray array];
    NSMutableArray *stringArray = [NSMutableArray array];
    for (int i = 0; i<textFieldArray.count; i++) {
        UITextField *tf = [textFieldArray objectAtIndex:i];
        NSString *string = tf.text;
        [stringArray addObject:string];
        if ([string isEqualToString:@""]) {
            [errorArray addObject:tf];
        }
    }
    NSString * string = [stringArray componentsJoinedByString:@""];
    NSArray *array =  [NSArray arrayWithArray:stringArray];
    if (string.length == array.count) {
        if (confirmPin == YES) {
            [self validationPIN:array];
        }else{
            [self completPin:array andString:string];
        }
    }else{
        UITextField *tf = [errorArray firstObject];
        for (UIView *view in self.subviews) {
            NSLog(@"TAG:%ld",(long)view.tag);
            if (view.tag == tf.tag) {
                [self animationErrorCell:view andTextField:tf andSelect:YES];
            }
        }
    }
}
/**
 validation code
 
 @param pinArray NSArray
 */
-(void)validationPIN:(NSArray*)pinArray{
    NSMutableArray *stringArray = [NSMutableArray array];
    int b = (int)pinArray.count/2;
    //
    for (int i = 0; i < pinArray.count/2; i++) {
        //
        if ([[pinArray objectAtIndex:i] isEqualToString:[pinArray objectAtIndex:b]]) {
            [stringArray addObject:[pinArray objectAtIndex:i]];
        }else{
            for (int i = (int)(textFieldArray.count/2); i<textFieldArray.count; i++) {
                UITextField *tf = [textFieldArray objectAtIndex:i];
                tf.text = @"";
                for (UIView *view in self.subviews) {
                    NSLog(@"TAG:%ld",(long)view.tag);
                    if (view.tag == tf.tag) {
                        [self animationErrorCell:view andTextField:tf andSelect:(i == (int)(textFieldArray.count/2))? YES: NO];
                    }
                }
            }
            return;
        }
        b++;
    }
    if (pinArray.count/2==stringArray.count) {
        [self completPin:stringArray andString:[stringArray componentsJoinedByString:@""]];
    }
}
/**
 Secure text entry with NSTimer
 
 @param theTimer NSTimer
 */
-(void)secureTextEntry:(NSTimer*)theTimer{
    UITextField *textField = theTimer.userInfo[@"id"];
    [textField setSecureTextEntry:(secureText == YES)?YES:NO];
}
/**
 Become first Cell
 */
-(void)becomeFirstCell{
    [[textFieldArray firstObject] becomeFirstResponder];
}
#pragma mark - Animation
/**
 Animatio error Cell
 
 @param view UIView
 @param textField UITextField
 @param select BOOL
 */
-(void)animationErrorCell:(UIView*)view andTextField:(UITextField*)textField andSelect:(BOOL)select{
    view.backgroundColor = [errorColor colorWithAlphaComponent:0.0];
    [UIView animateWithDuration:0.9 animations:^{
        view.backgroundColor = [errorColor colorWithAlphaComponent:1.0];
    }completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 animations:^{
            view.backgroundColor = [errorColor colorWithAlphaComponent:0.0];
        }completion:^(BOOL finished) {
            view.backgroundColor = [backgroundSelectColor colorWithAlphaComponent:0.0];
            [UIView animateWithDuration:0.5 animations:^{
                view.backgroundColor = [backgroundSelectColor colorWithAlphaComponent:(select==YES)?  0.5:0.0];
            }completion:^(BOOL finished) {
                if (select==YES) {
                    [textField becomeFirstResponder];
                }
                
            }];
        }];
    }];
}
/**
 Animation view background color with color and duration
 
 @param view UIView
 @param color UIColor
 @param duration NSTimeInterval
 */
-(void)animationViewBackGround:(UIView*)view andColor:(UIColor*)color andDuration:(NSTimeInterval)duration{
    [UIView animateWithDuration:duration animations:^{
        view.backgroundColor = color;
    }];
}
/**
 Select view with textField
 
 @param textField UITextField
 @param show bool
 */
-(void)selectView:(UITextField*)textField show:(bool)show{
    for (UIView *subview in self.subviews) {
        [UIView animateWithDuration:1.0 animations:^{
            if (show == NO) {
                if (subview.tag == textField.tag) {
                    selectView = subview;
                    NSDictionary *dic = @{@"id":textField};
                    [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(secureTextEntry:) userInfo:dic repeats:NO];
                }
            }else{
                if (subview.tag == textField.tag) {
                    deselectView = subview;
                }
            }
        }];
    }
    [self animationViewBackGround:deselectView andColor:backgroundSelectColor andDuration:0.5];
    [self animationViewBackGround:selectView andColor:[backgroundSelectColor colorWithAlphaComponent:0.0] andDuration:0.5];
}
//
#pragma mark - UITextFieldDelegate
// became first responder
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [textField setSecureTextEntry:NO];
    textField.text = @" ";
    [self selectView:textField show:YES];
    for (UITextField *field in self.subviews) {
        if (field.tag == textField.tag) {
            selectIndex = (int)[self.subviews indexOfObject:field];
        }
    }
}
// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self selectView:textField show:NO];
    textField.text = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
}
// return NO to not change text
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    [textField setSecureTextEntry:NO];
    if ([string isEqualToString:@" "]) {
        string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    if (range.location > 1) {
        textField.text = string;
        return NO;
    }else{
        textField.text = string;
    }
    if ([textField isEqual:[textFieldArray firstObject]]) {
        if ([textField.text isEqualToString:@""]) {
            [[textFieldArray firstObject] becomeFirstResponder];
        }else{
            [[textFieldArray objectAtIndex:1] becomeFirstResponder];
        }
    }
    if ([textField isEqual:[textFieldArray objectAtIndex:selectIndex]]) {
        if ([textField.text isEqualToString:@""]) {
            if (selectIndex != 0){
                [[textFieldArray objectAtIndex:selectIndex-1] becomeFirstResponder];
            }
        }else{
            if (selectIndex < textFieldArray.count-1) {
                [[textFieldArray objectAtIndex:selectIndex+1] becomeFirstResponder];
            }
            if ([textField isEqual:[textFieldArray lastObject]]) {
                [self actions];
            }
        }
    }
    return NO;
}
#pragma mark - KOPINCodeViewDelegate
/**
 Call back
 
 @param completion (^KOPinCodeViewCallback)(void)
 */
- (void)complet:(KOPinCodeViewCallback)completion {
    callback = completion;
    if(callback){
        callback();
    }
}
/**
 KOPINCodeViewDelegate
 Complet pin with array and String
 
 @param array NSArray
 @param string NSString
 */
- (void)completPin:(NSArray*)array andString:(NSString*)string {
    [self complet:^{
        if([self.delegate respondsToSelector:@selector(pinDidEnterAllSymbol:string:)]){
            [self.delegate pinDidEnterAllSymbol:array string:string];
        }
    }];
}
@end
