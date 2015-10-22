//
//  AddressInfo.h
//  私人通讯录1.0
//
//  Created by RenSihao on 15/10/1.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressInfo : NSObject

@property (nonatomic, copy)   NSString *name;
@property (nonatomic, strong) NSArray  *cities;
//利用plist文件实现该类对外接口
+ (NSArray *)addressInfoPlist;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (AddressInfo *)addressInfoInitWithDictionary:(NSDictionary *)dict;
@end
