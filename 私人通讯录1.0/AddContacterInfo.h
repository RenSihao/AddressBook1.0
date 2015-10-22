//
//  AddContacterInfo.h
//  私人通讯录1.0
//
//  Created by RenSihao on 15/9/30.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddContacterInfo : NSObject

@property (nonatomic, copy) NSString *title;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (AddContacterInfo *)addContacterInfoWithDictionary:(NSDictionary *)dict;
@end
