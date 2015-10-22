//
//  ContacterView.h
//  私人通讯录1.0
//
//  Created by RenSihao on 15/9/28.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ContacterView;

@protocol ContacterViewDelegate <NSObject>

@optional
- (void)exitItemDidClick:(ContacterView *)contacterView;
- (void)addItemDidClick:(ContacterView *)contacterView;
@end

@interface ContacterView : UIView

@property (nonatomic, weak) id<ContacterViewDelegate> delegate;
+ (instancetype)contacterViewInit;
@end
