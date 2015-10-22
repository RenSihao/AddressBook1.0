//
//  LoginView.m
//  私人通讯录1.0
//
//  Created by mac-001 on 15/9/25.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import "LoginView.h"
#import "MBProgressHUD+MJ.h"

#define HEADER_HEIGHT 64

#define MARGIN 5

#define ICON_WIDTH  100
#define ICON_HEIGHT 100

#define ACCOUNT_HEIGHT 40
#define CODE_HEIGHT    40
#define LOGIN_HEIGHT   40

#define REMEMBER_BTN_HEIGHT  30
#define AUTOLOGIN_BTN_HEIGHT 30

@interface LoginView () <LoginViewDelegate>

@property (nonatomic, strong) UIView          *backView;
@property (nonatomic, strong) UINavigationBar *headerBar;

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UITextField *accountTF;
@property (nonatomic, strong) UITextField *codeTF;
@property (nonatomic, strong) UIButton    *loginBtn;

@property (nonatomic, strong) UIButton *rememberAccountBtn;
@property (nonatomic, strong) UIButton *autoLoginBtn;
@property (nonatomic, strong) UIButton *registerBtn;
@property (nonatomic, strong) UIButton *forgetCodeBtn;
@end

@implementation LoginView

#pragma mark - 接口区域
+ (instancetype)loginViewInit
{
    LoginView *loginView = [[self alloc] init];
    
    return loginView;
}
- (instancetype)init
{
    if(self = [super init])
    {
        [self addSubview:self.backView];
        [self addSubview:self.headerBar];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changgeLoginBtn) name:UITextFieldTextDidChangeNotification object:self.accountTF];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changgeLoginBtn) name:UITextFieldTextDidChangeNotification object:self.codeTF];
    }
    return self;
}

#pragma mark - 延迟加载
- (UIView *)backView
{
    if(!_backView)
    {
        _backView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [_backView setBackgroundColor:[UIColor colorWithRed:0.2 green:0.6 blue:0.8 alpha:1]];
        [_backView addSubview:self.iconView];
        [_backView addSubview:self.accountTF];
        [_backView addSubview:self.codeTF];
        [_backView addSubview:self.loginBtn];
        
        [_backView addSubview:self.rememberAccountBtn];
        [_backView addSubview:self.autoLoginBtn];
    }
    return _backView;
}
- (UINavigationBar *)headerBar
{
    if(!_headerBar)
    {
        _headerBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 375, HEADER_HEIGHT)];
        [_headerBar setBarStyle:UIBarStyleDefault];
        [_headerBar setBackgroundColor:[UIColor colorWithRed:0.1 green:0.3 blue:0.8 alpha:1.0]];

        UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"私人通讯录1.0"];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
        item.leftBarButtonItem = leftItem;
        item.rightBarButtonItem = rightItem;
        
        _headerBar.items = @[item];
    }
    return _headerBar;
}
- (UIImageView *)iconView
{
    if(!_iconView)
    {
        _iconView = [[UIImageView alloc] initWithFrame:({
            CGRect frame =
            CGRectMake(0, 0, ICON_WIDTH, ICON_HEIGHT);
            frame;
        })];
        [_iconView setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width/2,
                                ([[UIScreen mainScreen] bounds].size.height-self.headerBar.frame.size.height)/4)];
        [_iconView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"account" ofType:@"png"]]];
    }
    return _iconView;
}

- (UITextField *)accountTF
{
    if(!_accountTF)
    {
        _accountTF = [[UITextField alloc] initWithFrame:({
            CGRect frame = CGRectMake(MARGIN, 4*MARGIN+CGRectGetMaxY(self.iconView.frame), [[UIScreen mainScreen] bounds].size.width-2*MARGIN, ACCOUNT_HEIGHT);
            frame;
        })];
        [_accountTF setBorderStyle:UITextBorderStyleRoundedRect];
        [_accountTF setBackgroundColor:[UIColor lightGrayColor]];
        [_accountTF setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [_accountTF setContentHorizontalAlignment:UIControlContentHorizontalAlignmentFill];
        [_accountTF setKeyboardType:UIKeyboardTypeTwitter];
        [_accountTF setKeyboardAppearance:UIKeyboardAppearanceLight];
        [_accountTF setReturnKeyType:UIReturnKeyDone];
        [_accountTF setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [_accountTF setPlaceholder:@"请输入账号"];
        [_accountTF setFont:[UIFont fontWithName:@"Arial" size:18.0f]];
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"account" ofType:@"png"]]];
        _accountTF.leftView = iv;
        _accountTF.leftViewMode = UITextFieldViewModeAlways;
        [_accountTF setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_accountTF setAutocorrectionType:UITextAutocorrectionTypeNo];
    }
    return _accountTF;
}

- (UITextField *)codeTF
{
    if(!_codeTF)
    {
        _codeTF = [[UITextField alloc] initWithFrame:({
            CGRect frame = CGRectMake(MARGIN, MARGIN+CGRectGetMaxY(self.accountTF.frame), [[UIScreen mainScreen] bounds].size.width-2*MARGIN, CODE_HEIGHT);
            frame;
        })];
        [_codeTF setBorderStyle:UITextBorderStyleRoundedRect];
        [_codeTF setBackgroundColor:[UIColor lightGrayColor]];
        [_codeTF setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [_codeTF setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [_codeTF setKeyboardType:UIKeyboardTypeDefault];
        [_codeTF setKeyboardAppearance:UIKeyboardAppearanceLight];
        [_codeTF setReturnKeyType:UIReturnKeyDone];
        [_codeTF setPlaceholder:@"请输入密码"];
        [_codeTF setFont:[UIFont fontWithName:@"Arial" size:18.0f]];
        [_codeTF setSecureTextEntry:YES];
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"account" ofType:@"png"]]];
        _codeTF.leftView = iv;
        _codeTF.leftViewMode = UITextFieldViewModeAlways;
        [_codeTF setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_codeTF setAutocorrectionType:UITextAutocorrectionTypeNo];
        [_codeTF setClearsOnBeginEditing:YES];
        
        
    }
    return _codeTF;
}
- (UIButton *)loginBtn
{
    if(!_loginBtn)
    {
        _loginBtn = [[UIButton alloc] initWithFrame:({
            CGRect frame = CGRectMake(MARGIN, 4*MARGIN+CGRectGetMaxY(self.codeTF.frame), [[UIScreen mainScreen] bounds].size.width-2*MARGIN, LOGIN_HEIGHT);
            frame;
        })];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:[UIColor grayColor]];
        [_loginBtn addTarget:self action:@selector(loginBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [_loginBtn setEnabled:NO];
    }
    return _loginBtn;
}
- (UIButton *)rememberAccountBtn
{
    if(!_rememberAccountBtn)
    {
        _rememberAccountBtn = [[UIButton alloc] initWithFrame:({
            CGRect frame =
            CGRectMake(4*MARGIN, 2*MARGIN+CGRectGetMaxY(self.loginBtn.frame), [[UIScreen mainScreen] bounds].size.width/4, REMEMBER_BTN_HEIGHT);
            frame;
        })];
        [_rememberAccountBtn.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [_rememberAccountBtn setTitle:@"记住密码" forState:UIControlStateNormal];
        [_rememberAccountBtn setBackgroundColor:[UIColor redColor]];
    }
    return _rememberAccountBtn;
}
- (UIButton *)autoLoginBtn
{
    if(!_autoLoginBtn)
    {
        _autoLoginBtn = [[UIButton alloc] initWithFrame:({
            CGRect frame =
            CGRectMake([[UIScreen mainScreen] bounds].size.width-4*MARGIN-[[UIScreen mainScreen] bounds].size.width/4, 2*MARGIN+CGRectGetMaxY(self.loginBtn.frame), [[UIScreen mainScreen] bounds].size.width/4, REMEMBER_BTN_HEIGHT);
            frame;
        })];
        [_autoLoginBtn.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [_autoLoginBtn setTitle:@"自动登录" forState:UIControlStateNormal];
        [_autoLoginBtn setBackgroundColor:[UIColor redColor]];
    }
    return _autoLoginBtn;
}
- (UIButton *)forgetCodeBtn
{
    if(!_forgetCodeBtn)
    {
        
    }
    return _forgetCodeBtn;
}
- (UIButton *)registerBtn
{
    if(!_registerBtn)
    {
        
    }
    return _registerBtn;
}
#pragma mark - LoginViewDelegate
- (void)loginBtnDidClick:(LoginView *)loginView
{
    /*if(!self.accountTF.text)
    {
        [MBProgressHUD showError:@"请输入用户名"];
        return;
    }
    if(![self.accountTF.text isEqualToString:@"rensihao"])
    {
        [MBProgressHUD showError:@"用户名不存在"];
        return;
    }
    if(![self.codeTF.text isEqualToString:@"123"])
    {
        [MBProgressHUD showError:@"密码输入错误"];
        return ;
    }
    [MBProgressHUD showMessage:@"努力加载中..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)2*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        if([self.delegate respondsToSelector:@selector(loginBtnDidClick:)])
            [self.delegate loginBtnDidClick:self];
    });*/
    if([self.delegate respondsToSelector:@selector(loginBtnDidClick:)])
        [self.delegate loginBtnDidClick:self];

    
}

//----------------------
- (void)changgeLoginBtn
{
    if(self.accountTF.text.length && self.codeTF.text.length)
    {
        self.loginBtn.enabled = YES;
        [self.loginBtn setBackgroundColor:[UIColor orangeColor]];
    }
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
