//
//  AddContacterInfo.m
//  私人通讯录1.0
//
//  Created by RenSihao on 15/9/30.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import "AddContacterGroupInfo.h"
#import "AddContacterInfo.h"

@implementation AddContacterGroupInfo
+ (AddContacterGroupInfo *)addContacterGroupInfoInitWithArray:(NSArray *)array
{
    return [[self alloc] initWithArray:array];
}
- (instancetype)initWithArray:(NSArray *)array
{
    if(self = [super init])
    {
        self.group = array;
    }
    return self;
}
+ (NSArray *)addContacterGroupInfoPlist
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"addContacter" ofType:@"plist"]];
    NSMutableArray *addContacterGroupArray = [NSMutableArray array];
    for(NSArray *groupArray in array)
    {
        AddContacterGroupInfo *addContacterInfo = [self addContacterGroupInfoInitWithArray:groupArray];
        /*-------------------数据模型内嵌其他数据模型---------------*/
        NSMutableArray *addContacterInfoArray = [NSMutableArray array];
        for(NSDictionary *addContacterInfoDict in addContacterInfo.group)
        {
            AddContacterInfo *addContacterInfo = [AddContacterInfo  addContacterInfoWithDictionary:addContacterInfoDict];
            [addContacterInfoArray addObject:addContacterInfo];
        }
        addContacterInfo.group = addContacterInfoArray;
        /*－－－－－－－－－－－－－－－分割线－－－－－－－－－－－－－－－*/
        [addContacterGroupArray addObject:addContacterInfo];
    }
    return addContacterGroupArray;
}

@end
