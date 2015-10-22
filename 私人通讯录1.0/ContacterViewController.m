//
//  ContacterViewController.m
//  私人通讯录1.0
//
//  Created by RenSihao on 15/9/28.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import "ContacterViewController.h"
#import "ContacterView.h"
#import "AddContacterViewController.h"

@interface ContacterViewController () <ContacterViewDelegate>

@end

@implementation ContacterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ContacterView *contacterView = [ContacterView contacterViewInit];
    contacterView.delegate = self;
    self.view = contacterView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ContacterViewDelegate

- (void)exitItemDidClick:(ContacterView *)contacterView
{
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"是否退出该账号" message:@"确定退出吗" preferredStyle:UIAlertControllerStyleActionSheet];
    [alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self.navigationController popToRootViewControllerAnimated:YES];
    }]];
    [alertView addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        
    }]];
    [self presentViewController:alertView animated:YES completion:^{
        
    }];
}
- (void)addItemDidClick:(ContacterView *)contacterView
{
    AddContacterViewController *addContacterVC = [[AddContacterViewController alloc] init];
    [self.navigationController pushViewController:addContacterVC animated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
