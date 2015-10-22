//
//  AddContacterTableViewCell.m
//  私人通讯录1.0
//
//  Created by RenSihao on 15/9/30.
//  Copyright © 2015年 mac-001. All rights reserved.
//

#import "AddContacterTableViewCell.h"
#import "AddContacterInfo.h"
#import "AddressInfo.h"
#define MARGIN 5
#define TITLE_LAB_WIDTH 100
#define TITLE_LAB_HEIGHT 30

@interface AddContacterTableViewCell () <UIPickerViewDataSource, UIPickerViewDelegate>




@property (nonatomic, strong) UIPickerView *sexPicker;
@property (nonatomic, strong) NSArray      *sexInfoArray;

@property (nonatomic, strong) UIPickerView *addressPicker;
@property (nonatomic, strong) NSArray      *addressInfoArray;

@property (nonatomic, strong) UIToolbar *keyboardBar;
@property (nonatomic, assign) NSInteger index;
@end

@implementation AddContacterTableViewCell

#pragma mark - 接口部分
+ (instancetype)addContacterTableViewCellInitWith:(UITableView *)tableView withAddContacterInfo:(AddContacterInfo *)addContacterInfo
{
//    static NSString *reuseID = @"addContacter";
//    AddContacterTableViewCell *cell = [tableView  dequeueReusableCellWithIdentifier:reuseID];
//    if(!cell)
//    {
//        cell = [[AddContacterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
//    }
//    cell.addContacterInfo = addContacterInfo;
    AddContacterTableViewCell *cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.addContacterInfo = addContacterInfo;
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, MARGIN, TITLE_LAB_WIDTH, TITLE_LAB_HEIGHT)];
        self.titleLab.font = [UIFont systemFontOfSize:15.0f];
        self.titleLab.textAlignment = NSTextAlignmentLeft;
        self.titleTF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLab.frame), MARGIN, [[UIScreen mainScreen] bounds].size.width-MARGIN-self.titleLab.frame.size.width, self.titleLab.frame.size.height)];
        
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.titleTF];
    }
    return self;
}

#pragma mark - 懒加载
- (UIToolbar *)keyboardBar
{
    if(!_keyboardBar)
    {
        _keyboardBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 30)];
        UIBarButtonItem *previous = [[UIBarButtonItem alloc] initWithTitle:@"前一项" style:UIBarButtonItemStylePlain target:self action:nil];
        UIBarButtonItem *after = [[UIBarButtonItem alloc] initWithTitle:@"后一项" style:UIBarButtonItemStylePlain target:self action:nil];
        UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];
        _keyboardBar.items = @[previous, after, flex, done];
    }
    return _keyboardBar;
}
- (UIPickerView *)sexPicker
{
    if(!_sexPicker)
    {
        _sexPicker = [[UIPickerView alloc] init];
        [_sexPicker addSubview:self.keyboardBar];
        _sexPicker.dataSource = self;
        _sexPicker.delegate   = self;
    }
    return _sexPicker;
}
- (NSArray *)sexInfoArray
{
    if(!_sexInfoArray)
    {
        _sexInfoArray = [NSArray arrayWithObjects:@"不限", @"男", @"女", nil];
    }
    return _sexInfoArray;
}
- (UIPickerView *)addressPicker
{
    if(!_addressPicker)
    {
        _addressPicker = [[UIPickerView alloc] init];
        [_sexPicker addSubview:self.keyboardBar];
        _addressPicker.dataSource = self;
        _addressPicker.delegate   = self;
    }
    return _addressPicker;
}
- (NSArray *)addressInfoArray
{
    if(!_addressInfoArray)
    {
        _addressInfoArray = [AddressInfo addressInfoPlist];
    }
    return _addressInfoArray;
}
#pragma mark - 更新数据展示
- (void)setAddContacterInfo:(AddContacterInfo *)addContacterInfo
{
    _addContacterInfo = addContacterInfo;
    self.titleLab.text = self.addContacterInfo.title;
    //cell选中风格为不显示 键盘外观统一为alert 首字母不大写 不自动纠正
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.titleTF.keyboardAppearance = UIKeyboardAppearanceLight;
    self.titleTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.titleTF.autocorrectionType = UITextAutocorrectionTypeNo;
    if([self.titleLab.text isEqualToString:@"昵称"])
    {
        self.titleTF.keyboardType = UIKeyboardTypeDefault;
        
    }
    if([self.titleLab.text isEqualToString:@"性别"])
    {
        self.titleTF.inputView = self.sexPicker;
        
    }
    if([self.titleLab.text isEqualToString:@"生日"])
    {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh"];
        [datePicker addSubview:self.keyboardBar];
        self.titleTF.inputView = datePicker;
        
    }
    if([self.titleLab.text isEqualToString:@"职业"])
    {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if([self.titleLab.text isEqualToString:@"公司"])
    {
        self.titleTF.keyboardType = UIKeyboardTypeDefault;
        
    }
    if([self.titleLab.text isEqualToString:@"学校"])
    {
        
    }
    if([self.titleLab.text isEqualToString:@"所在地"])
    {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.titleTF.inputView = self.addressPicker;
    }
    if([self.titleLab.text isEqualToString:@"故乡"])
    {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if([self.titleLab.text isEqualToString:@"邮箱"])
    {
        self.titleTF.keyboardType = UIKeyboardTypeEmailAddress;
    }
    if([self.titleLab.text isEqualToString:@"个人说明"])
    {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if([self.titleLab.text isEqualToString:@"兴趣爱好展示设置"])
    {
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if(self.sexPicker == pickerView)
    {
        return 1;
    }
    if(self.addressPicker == pickerView)
    {
        return 2;
    }
    return -1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(self.sexPicker == pickerView)
    {
        return self.sexInfoArray.count;
    }
    if(self.addressPicker == pickerView)
    {
        if(component == 0)
        {
            return self.addressInfoArray.count;
        }
        if(component == 1)
        {
            return [self.addressInfoArray[self.index] cities].count;
        }
        
    }
    return -1;
}
#pragma mark - UIPickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if(self.sexPicker == pickerView)
    {
        return [[UIScreen mainScreen] bounds].size.width;
    }
    if(self.addressPicker == pickerView)
    {
        return [[UIScreen mainScreen] bounds].size.width/2;
    }
    return -1;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    if(self.sexPicker == pickerView)
    {
        return 30;
    }
    if(self.addressPicker == pickerView)
    {
        return 30;
    }
    return -1;
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(self.sexPicker == pickerView)
    {
        return self.sexInfoArray[row];
    }
    if(self.addressPicker == pickerView)
    {
        if(component == 0)
        {
            return [self.addressInfoArray[row] name];
        }
        if(component == 1)
        {
            return [self.addressInfoArray[self.index] cities][row];
        }
        
    }
    return @"error";
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(self.sexPicker == pickerView)
    {
        return;
    }
    if(self.addressPicker == pickerView)
    {
        if(component == 0)
        {
            self.index = row;
            [self.addressPicker reloadComponent:1];
            [self.addressPicker selectRow:0 inComponent:1 animated:YES];
        }
        if(component == 1)
        {
            
        }
    }
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
