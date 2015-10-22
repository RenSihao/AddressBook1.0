//
//  AddContacterView.m
//  私人通讯录1.0
//
//  Created by RenSihao on 15/9/29.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import "AddContacterView.h"
#import "AddContacterGroupInfo.h"
#import "AddContacterTableViewCell.h"
#import "ContacterInfo.h"
#define HEADER_HEIGHT 64

@interface AddContacterView () <AddContacterViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UINavigationBar *headerBar;
@property (nonatomic, strong) UITableView     *tableView;
@property (nonatomic, strong) NSArray         *addContacterGroupInfoPlist;
@property (nonatomic, strong) NSMutableArray  *allCell;
@end

@implementation AddContacterView

#pragma mark - 接口部分
+ (instancetype)addContacterViewInit
{
    AddContacterView *addContacterView = [[AddContacterView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    return addContacterView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self addSubview:self.headerBar];
        [self addSubview:self.tableView];
    }
    return self;
}

#pragma mark - 懒加载
- (UINavigationBar *)headerBar
{
    if(!_headerBar)
    {
        _headerBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, HEADER_HEIGHT)];
        UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"新联系人"];
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelItemDidClick:)];
        UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveItemDidClick:)];
        item.leftBarButtonItem = cancelItem;
        item.rightBarButtonItem = saveItem;
        _headerBar.items = @[item];
    }
    return _headerBar;
}
- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:({
            
            CGRect frame = CGRectMake(0,
                                      CGRectGetMaxY(self.headerBar.frame),
                                      [[UIScreen mainScreen] bounds].size.width,
                                      [[UIScreen mainScreen] bounds].size.height-self.headerBar.frame.size.height);
            frame;
        })
                                                  style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate   = self;
        _tableView.allowsSelection = NO;
        
    }
    return _tableView;
}
- (NSArray *)addContacterGroupInfoPlist
{
    if(!_addContacterGroupInfoPlist)
    {
        _addContacterGroupInfoPlist = [AddContacterGroupInfo addContacterGroupInfoPlist];
    }
    return _addContacterGroupInfoPlist;
}
- (NSMutableArray *)allCell
{
    if(!_allCell)
    {
        _allCell = [NSMutableArray array];
    }
    return _allCell;
}
#pragma mark -  UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.addContacterGroupInfoPlist.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.addContacterGroupInfoPlist[section] group] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AddContacterTableViewCell *cell = [AddContacterTableViewCell addContacterTableViewCellInitWith:tableView withAddContacterInfo:[self.addContacterGroupInfoPlist[indexPath.section] group][indexPath.row]];
    [self.allCell addObject:cell];
    return cell;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"%ld组头", section];
}
//- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    return [NSString stringWithFormat:@"%ld组尾", section];
//}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 20;
//}
#pragma mark - AddContacterDelegate
- (void)cancelItemDidClick:(AddContacterView *)addContacterView
{
    if([self.delegate respondsToSelector:@selector(cancelItemDidClick:)])
        [self.delegate cancelItemDidClick:self];
}
- (void)saveItemDidClick:(AddContacterView *)addContacterView
{
    ContacterInfo *contacterInfo = [[ContacterInfo alloc] init];
    
    for(AddContacterTableViewCell *cell in self.allCell)
    {
        if([cell.titleLab.text isEqualToString:@"昵称"])
            contacterInfo.name = cell.titleTF.text;
        if([cell.titleLab.text isEqualToString:@"性别"])
            contacterInfo.sex = cell.titleTF.text;
        if([cell.titleLab.text isEqualToString:@"生日"])
            contacterInfo.birth = cell.titleTF.text;
    }
    
    if([self.delegate respondsToSelector:@selector(saveItemDidClick:withContacterInfo:)])
        [self.delegate saveItemDidClick:self withContacterInfo:contacterInfo];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
