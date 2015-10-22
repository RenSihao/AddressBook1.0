//
//  ContacterView.m
//  私人通讯录1.0
//
//  Created by RenSihao on 15/9/28.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import "ContacterView.h"
#import "ContacterInfo.h"

#define HEADER_HEIGHT 64

@interface ContacterView () <ContacterViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UINavigationBar *headerBar;
@property (nonatomic, strong) UITableView     *tableView;
@property (nonatomic, strong) NSMutableArray  *contactersList;

@end

@implementation ContacterView

#pragma mark - 接口部分
+ (instancetype)contacterViewInit
{
    ContacterView *contacterView = [[ContacterView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    return contacterView;
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
        UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:@"所有联系人"];
        UIBarButtonItem *exitItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(exitItemDidClick:)];
        UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItemDidClick:)];
        item.leftBarButtonItem = exitItem;
        item.rightBarButtonItem = addItem;
        
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
                      style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
    }
    return _tableView;
}
- (NSMutableArray *)contactersList
{
    if(!_contactersList)
    {
        
        _contactersList = [NSMutableArray array];
    }
    return _contactersList;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contactersList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"contacter";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    cell.textLabel.text = [self.contactersList[indexPath.row] name];
    cell.detailTextLabel.text = [self.contactersList[indexPath.row] sex];
    
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}
#pragma mark - ContacterViewDelegate
- (void)exitItemDidClick:(ContacterView *)contacterView
{
    if([self.delegate respondsToSelector:@selector(exitItemDidClick:)])
        [self.delegate exitItemDidClick:self];
}
- (void)addItemDidClick:(ContacterView *)contacterView
{
    if([self.delegate respondsToSelector:@selector(addItemDidClick:)])
        [self.delegate addItemDidClick:self];
}






@end
