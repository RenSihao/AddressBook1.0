//
//  AddContacterViewController.m
//  私人通讯录1.0
//
//  Created by RenSihao on 15/9/29.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import "AddContacterViewController.h"
#import "AddContacterView.h"

@interface AddContacterViewController () <AddContacterViewDelegate>

@end

@implementation AddContacterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AddContacterView *addContacterView = [AddContacterView addContacterViewInit];
    addContacterView.delegate = self;
    self.view = addContacterView;
//    NSLog(@"%@", self.navigationController.viewControllers[2]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AddContacterViewDelegate
- (void)cancelItemDidClick:(AddContacterView *)addContacterView
{
    [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
}
- (void)saveItemDidClick:(AddContacterView *)addContacterView withContacterInfo:(ContacterInfo *)contacterInfo
{
    //传递过来新联系人所有信息
    ContacterInfo *newContacterInfo = contacterInfo;
    
    
    
    [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
