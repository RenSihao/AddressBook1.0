//
//  ContacterInfo.h
//  私人通讯录1.0
//
//  Created by RenSihao on 15/10/2.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContacterInfo : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *birth;
@end
