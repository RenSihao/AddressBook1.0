//
//  AddContacterTableViewCell.h
//  私人通讯录1.0
//
//  Created by RenSihao on 15/9/30.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddContacterInfo;
@interface AddContacterTableViewCell : UITableViewCell

@property (nonatomic, strong) AddContacterInfo *addContacterInfo;
@property (nonatomic, strong) UILabel     *titleLab;
@property (nonatomic, strong) UITextField *titleTF;
+ (instancetype)addContacterTableViewCellInitWith:(UITableView *)tableView withAddContacterInfo:(AddContacterInfo *)addContacterInfo;
@end
