//
//  LoginView.h
//  私人通讯录1.0
//
//  Created by mac-001 on 15/9/25.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginView;
@protocol LoginViewDelegate <NSObject>

@optional
- (void)loginBtnDidClick:(LoginView *)loginView;
@end

@interface LoginView : UIView

@property (nonatomic, weak) id<LoginViewDelegate> delegate;
+ (instancetype)loginViewInit;
@end
