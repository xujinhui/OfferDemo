//
//  LoginViewController.m
//  OfferDemo
//
//  Created by xuewuguojie on 16/8/17.
//  Copyright © 2016年 xuewuguojie. All rights reserved.
//

#import "RegistViewController.h"

#define XIMAGE(imageName)  [UIImage imageNamed:imageName]

@interface RegistViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField *phoneTF;
@property(nonatomic,strong)UITextField *passwordTF;
@property(nonatomic,strong)UITextField *VerifyTF;
@property(nonatomic,strong)UIButton *agreeBtn;
@property(nonatomic,strong)UIButton *protocalBtn;
@property(nonatomic,strong)UIButton *submitBtn;
@property(nonatomic,strong)UIButton *VerityBtn;


@end

@implementation RegistViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    UIScrollView *bgScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    self.title = @"注册";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.phoneTF =[self textFieldWithPlaceHolder:@"手机号码" top:64 + 30];
    self.VerifyTF =[self textFieldWithPlaceHolder:@"验证码" top:CGRectGetMaxY(self.phoneTF.frame) + 15];
 
    self.passwordTF =[self textFieldWithPlaceHolder:@"登录密码" top:CGRectGetMaxY(self.VerifyTF.frame) + 15];
    self.passwordTF.keyboardType = UIKeyboardTypeDefault;

    
    self.agreeBtn =[[UIButton alloc] initWithFrame:CGRectMake( XPERCENT * 30, CGRectGetMaxY(self.passwordTF.frame)  + 30, 20, 20)];
    [self.agreeBtn setImage:[UIImage imageNamed:@"check-icons"] forState:UIControlStateNormal];
    [self.agreeBtn setImage:[UIImage imageNamed:@"check-icons-yes"] forState:UIControlStateSelected];
    [self.agreeBtn addTarget:self action:@selector(agreeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.agreeBtn];
    
    UILabel *agreeLab =[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.agreeBtn.frame) + 5, CGRectGetMaxY(self.passwordTF.frame)  + 30, 50, 20)];
    [self.view addSubview:agreeLab];
    agreeLab.textColor = [UIColor lightGrayColor];
    agreeLab.text = @"同意";
    agreeLab.font = [UIFont systemFontOfSize:14];
 
    self.protocalBtn =[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(agreeLab.frame), CGRectGetMaxY(self.passwordTF.frame)  + 30, 100, 20)];
    [self.protocalBtn setTitle:@"《用户协议》" forState:UIControlStateNormal];
    [self.view addSubview:self.protocalBtn];
    self.protocalBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.protocalBtn setTitleColor: [UIColor greenColor] forState:UIControlStateNormal];
    self.protocalBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    
    self.submitBtn =[[UIButton alloc] initWithFrame:CGRectMake(XPERCENT * 30, CGRectGetMaxY(self.agreeBtn.frame)  + 30, SCREEN_WIDTH - XPERCENT * 30 * 2,  XPERCENT * 40)];
    [self.submitBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self cornerRadiusWithsender:self.submitBtn];
    
    
    
    
    self.VerityBtn =[[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.VerifyTF.frame) - 100 - 5 , CGRectGetMinY(self.VerifyTF.frame) + 5, 100,  XPERCENT * 40 - 10)];
    [self.VerityBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self cornerRadiusWithsender:self.VerityBtn];
     self.VerityBtn.layer.cornerRadius = (XPERCENT * 40  - 10)* 0.5 ;

    [self makeNotificationCenter];
}


- (void)makeNotificationCenter
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}


-(void)cornerRadiusWithsender:(UIButton *)sender{

    
    [sender setBackgroundImage:XIMAGE(@"submit_disable") forState:UIControlStateDisabled];
    [sender setBackgroundImage:XIMAGE(@"submit_nomal") forState:UIControlStateNormal];
    [sender setBackgroundImage:XIMAGE(@"submit_highlighted") forState:UIControlStateHighlighted];
    
    [self.view addSubview:sender];
    sender.layer.cornerRadius =  XPERCENT * 40  * 0.5;
    sender.layer.masksToBounds = YES;
    
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sender setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
     sender.titleLabel.font =[UIFont systemFontOfSize:16];
    
    sender.enabled  = NO;

}


-(UITextField *)textFieldWithPlaceHolder:(NSString *)placeHodler top:(CGFloat)top{

    UITextField * TF =  [[UITextField alloc] initWithFrame:CGRectMake( XPERCENT * 30, top, SCREEN_WIDTH - XPERCENT * 30 * 2, XPERCENT * 40)];
    TF.delegate = self;
    TF.font =[UIFont systemFontOfSize:14];
    TF.placeholder = placeHodler;
    TF.layer.cornerRadius =  XPERCENT * 40  * 0.5;
    TF.layer.masksToBounds = YES;
    TF.layer.borderWidth = 1;
    TF.layer.borderColor = [UIColor lightGrayColor].CGColor;
    TF.clearButtonMode =  UITextFieldViewModeWhileEditing;
    [self.view addSubview:TF];
    TF.keyboardType = UIKeyboardTypeNumberPad;
    [TF addTarget:self action:@selector(phoneTFEditting:) forControlEvents:UIControlEventEditingChanged];

    
    UIImageView *leftView =[[UIImageView alloc] initWithFrame:CGRectMake(15, 0, XPERCENT * 40 + 10,XPERCENT * 40)];
    leftView.contentMode = UIViewContentModeCenter;
    TF.leftViewMode =  UITextFieldViewModeAlways;
    TF.leftView = leftView;
    leftView.image = [UIImage imageNamed:@"login_left"];

    
    return TF;
}


#pragma mark ——— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    textField.layer.borderColor = [UIColor greenColor].CGColor;
    
    return  YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{

    
    textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

-(void)agreeBtnClick:(UIButton *)sender{

    sender.selected = !sender.selected;
    
    self.submitBtn.enabled = sender.selected;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];
}

-(void)phoneTFEditting:(UITextField *)textField{

    if (textField == self.phoneTF) {
        
        if(textField.text.length > 11){
            
            textField.text = [textField.text substringWithRange:NSMakeRange(0, 11)];
        }
        
        self.VerityBtn.enabled = textField.text.length == 11;

    }else if(textField == self.VerifyTF){
    
        if(textField.text.length > 6){
            
            textField.text = [textField.text substringWithRange:NSMakeRange(0, 6)];
        }
    }else{
    
        if(textField.text.length > 15){
            
            textField.text = [textField.text substringWithRange:NSMakeRange(0, 15)];
            UIAlertView *aler =[[UIAlertView alloc] initWithTitle:@"不超过15个字符" message:nil delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil];
            [aler show];
        }
    }
    
}


#pragma mark ——————- 键盘处理
- (void)keyboardWillShow:(NSNotification *)aNotification {
     [self moveTextViewForKeyboard:aNotification up:YES];
}

- (void)keyboardWillHide:(NSNotification *)aNotification {

    [self moveTextViewForKeyboard:aNotification up:NO];
}

- (void) moveTextViewForKeyboard:(NSNotification*)aNotification up: (BOOL) up {
    NSDictionary* userInfo = [aNotification userInfo];
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    CGRect keyboardEndFrame;
    
    [userInfo[UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [userInfo[UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [userInfo[UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
  
    // Animate up or down
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    
    
    
    CGFloat  heigh = self.view.frame.size.height - CGRectGetMaxY(self.submitBtn.frame) - keyboardEndFrame.size.height;
    
    
    if (heigh < 0 && up) {
        
        self.view.center = CGPointMake(self.view.frame.size.width / 2.0f, self.view.frame.size.height / 2.0f + heigh);
        
    } else {
        
         self.view.center = CGPointMake(self.view.frame.size.width / 2.0f, self.view.frame.size.height / 2.0f);
    }
    
    [self.view layoutSubviews];
    
    [UIView commitAnimations];
}





@end
