//
//  LoginViewController.m
//  私人通讯录1.0
//
//  Created by mac-001 on 15/9/25.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "ContacterViewController.h"

@interface LoginViewController () <LoginViewDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    LoginView *loginView = [LoginView loginViewInit];
    loginView.delegate = self;
    self.view = loginView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LoginViewDelegate
- (void)loginBtnDidClick:(LoginView *)loginView
{
    ContacterViewController *contacterVC = [[ContacterViewController alloc] init];
    [self.navigationController pushViewController:contacterVC animated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
}


@end
