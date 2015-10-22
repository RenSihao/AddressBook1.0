//
//  AddContacterView.h
//  私人通讯录1.0
//
//  Created by RenSihao on 15/9/29.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddContacterView;
@class ContacterInfo;

@protocol AddContacterViewDelegate <NSObject>

@optional
- (void)cancelItemDidClick:(AddContacterView *)addContacterView;
- (void)saveItemDidClick:(AddContacterView *)addContacterView withContacterInfo:(ContacterInfo *)contacterInfo;
@end

@interface AddContacterView : UIView

@property (nonatomic, weak) id<AddContacterViewDelegate> delegate;
+ (instancetype)addContacterViewInit;
@end
