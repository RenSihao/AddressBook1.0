//
//  AddContacterInfo.m
//  私人通讯录1.0
//
//  Created by RenSihao on 15/9/30.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import "AddContacterInfo.h"

@implementation AddContacterInfo
+ (AddContacterInfo *)addContacterInfoWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
