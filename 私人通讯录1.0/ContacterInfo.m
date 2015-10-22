//
//  ContacterInfo.m
//  私人通讯录1.0
//
//  Created by RenSihao on 15/10/2.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import "ContacterInfo.h"

@implementation ContacterInfo

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.sex forKey:@"sex"];
    [aCoder encodeObject:self.birth forKey:@"birth"];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init])
    {
        self.name  = [aDecoder decodeObjectForKey:@"name"];
        self.sex   = [aDecoder decodeObjectForKey:@"sex"];
        self.birth = [aDecoder decodeObjectForKey:@"birth"];
    }
    return self;
}
@end
