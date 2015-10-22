//
//  AddressInfo.m
//  私人通讯录1.0
//
//  Created by RenSihao on 15/10/1.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import "AddressInfo.h"

@implementation AddressInfo
+ (AddressInfo *)addressInfoInitWithDictionary:(NSDictionary *)dict
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
+ (NSArray *)addressInfoPlist
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"provinces" ofType:@"plist"]];
    NSMutableArray *addressArray = [NSMutableArray array];
    for(NSDictionary *addressDict in array)
    {
        AddressInfo *addressInfo = [self addressInfoInitWithDictionary:addressDict];
        /*-------------------数据模型内嵌其他数据模型---------------
        NSMutableArray *personInfoArray = [NSMutableArray array];
        for(NSDictionary *personDict in contacterInfo.friends)
        {
            PersonInfo *personInfo = [PersonInfo personInfoWithDictionary:personDict];
            [personInfoArray addObject:personInfo];
        }
        contacterInfo.friends = personInfoArray;
        －－－－－－－－－－－－－－－分割线－－－－－－－－－－－－－－－*/
        [addressArray addObject:addressInfo];
    }
    return addressArray;
}

@end
