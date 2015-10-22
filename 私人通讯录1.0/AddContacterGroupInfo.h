//
//  AddContacterInfo.h
//  私人通讯录1.0
//
//  Created by RenSihao on 15/9/30.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddContacterGroupInfo : NSObject

@property (nonatomic, copy) NSArray *group;
//利用plist文件实现该类对外接口
+ (NSArray *)addContacterGroupInfoPlist;
- (instancetype)initWithArray:(NSArray *)array;
+ (AddContacterGroupInfo *)addContacterGroupInfoInitWithArray:(NSArray *)array;
@end
