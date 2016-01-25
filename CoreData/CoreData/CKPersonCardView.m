
//
//  CKPersonCardView.m
//  CoreData
//
//  Created by user on 16/1/19.
//  Copyright © 2016年 user. All rights reserved.
//

#import "CKPersonCardView.h"

@interface CKPersonCardView ()

@property (nonatomic,strong) UIView *backView;

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) UILabel *numberLabel;

@property (nonatomic,strong) UILabel *nameLabel;

@property (nonatomic,strong) UILabel *sexLabel;

@property (nonatomic,strong) UILabel *nationLabel;

@property (nonatomic,strong) UILabel *yearLabel;

@property (nonatomic,strong) UILabel *monthLabel;

@property (nonatomic,strong) UILabel *dayLabel;

@property (nonatomic,strong) UILabel *addressLabel;

@property (nonatomic,strong) UILabel *idLabel;

@property (nonatomic,strong) UIImageView *avatarImageView;
@end

@implementation CKPersonCardView

#define SCREENW [UIScreen mainScreen].bounds.size.width
#define SCREENH [UIScreen mainScreen].bounds.size.height

#define aFONT 16;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addSubview:self.backView];
        [self addSubview:self.imageView];
        [self addSubview:self.numberLabel];
        [self addSubview:self.nameLabel];
        [self addSubview:self.sexLabel];
        [self addSubview:self.nationLabel];
        [self addSubview:self.yearLabel];
        [self addSubview:self.monthLabel];
        [self addSubview:self.dayLabel];
        [self addSubview:self.addressLabel];
        [self addSubview:self.idLabel];
        [self addSubview:self.avatarImageView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //原图为 328 * 214   距离左边距 35
    
    _backView.frame = self.frame;
    _imageView.frame = self.frame;
    
    
    CGFloat W = self.bounds.size.width;
    CGFloat H = self.bounds.size.height;
    //行与行之间的距离
    CGFloat distance;
    distance = H * 4.5 / 107;
    
    CGFloat leftW;
    leftW = W * 35 / 164;
    CGFloat leftH;
    leftH = H * 15 / 107;
    
    _nameLabel.frame = CGRectMake(leftW, leftH, W * 70 / 164, H * 8 / 107);
    
    _sexLabel.frame = CGRectMake(leftW, CGRectGetMaxY(_nameLabel.frame) + distance, W * 14 / 164, H * 8 / 107);
    
    _nationLabel.frame = CGRectMake(W * 67 / 164, CGRectGetMaxY(_nameLabel.frame) + distance, W * 40 / 167, H * 8 / 107);
    
    _yearLabel.frame = CGRectMake(leftW - 10, CGRectGetMaxY(_nationLabel.frame) + distance, W * 18 / 164, H * 8 / 107);
    
    _monthLabel.frame = CGRectMake(W * 56 / 164, CGRectGetMaxY(_nationLabel.frame) + distance, W * 9 / 164, H * 8 / 107);
    
    _dayLabel.frame = CGRectMake(W * 71 / 164, CGRectGetMaxY(_nationLabel.frame) + distance, W * 9 / 164, H * 8 / 107);
    
    _addressLabel.frame = CGRectMake(leftW, CGRectGetMaxY(_yearLabel.frame) + distance, W * 77 / 164, H * 18 / 107);
    
    _idLabel.frame = CGRectMake(W * 52 / 164, H * 87 / 107, W * 106 / 164, H * 8 / 107);
    
    _numberLabel.frame = CGRectMake(W - 80, 10, 80, 20);
    
    _avatarImageView.frame = CGRectMake(W * 125/ 164, H * 15 / 107, W * 35 / 164, H * 50 / 107);
}

#pragma mark - Getter And Setter
- (void)setPerson:(Person *)person
{
    _nameLabel.text = person.name;
    _sexLabel.text = person.sex == 1 ? @"男":@"女";
    _nationLabel.text = person.national;
    _yearLabel.text = person.birth_year;
    _monthLabel.text = person.birth_month;
    _dayLabel.text = person.birth_day;
    _addressLabel.text = person.address;
    _idLabel.text = person.id;
    _avatarImageView.image = [UIImage imageNamed:person.avatarURL];
}

- (void)setCard:(Card *)card
{
    _numberLabel.text = card.card_id;
}


- (UIView *)backView
{
    if (_backView == nil) {
        
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor clearColor];
        
    }
    return _backView;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
        [_imageView setImage:[UIImage imageNamed:@"forward.jpg"]];
        
    }
    return _imageView;
}

- (UILabel *)numberLabel
{
    if (_numberLabel == nil) {
        
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.textAlignment = NSTextAlignmentRight;
        _numberLabel.font = [UIFont boldSystemFontOfSize:16];
        _numberLabel.numberOfLines = 0;
        
    }
    return _numberLabel;
}

- (UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        [_nameLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [_nameLabel setNumberOfLines:1];
    }
    return _nameLabel;
}

- (UILabel *)sexLabel
{
    if (_sexLabel == nil) {
        _sexLabel = [[UILabel alloc] init];
        [_sexLabel setNumberOfLines:1];
        [_sexLabel setFont:[UIFont boldSystemFontOfSize:16]];
    }
    return _sexLabel;
}

- (UILabel *)nationLabel
{
    if (_nationLabel == nil) {
        _nationLabel = [[UILabel alloc] init];
        [_nationLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [_nationLabel setNumberOfLines:1];
    }
    return _nationLabel;
}

- (UILabel *)yearLabel
{
    if (_yearLabel == nil) {
        _yearLabel = [[UILabel alloc] init];
        [_yearLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [_yearLabel setNumberOfLines:1];
    }
    return _yearLabel;
}

- (UILabel *)monthLabel
{
    if (_monthLabel == nil) {
        _monthLabel = [[UILabel alloc] init];
        [_monthLabel setFont:[UIFont systemFontOfSize:16]];
    }
    return _monthLabel;
}

- (UILabel *)dayLabel
{
    if (_dayLabel == nil) {
        _dayLabel = [[UILabel alloc] init];
        [_dayLabel setFont:[UIFont systemFontOfSize:16]];
        [_dayLabel setNumberOfLines:1];
    }
    return _dayLabel;
}

- (UILabel *)addressLabel
{
    if (_addressLabel == nil) {
        _addressLabel = [[UILabel alloc] init];
        [_addressLabel setFont:[UIFont systemFontOfSize:16]];
        [_addressLabel setNumberOfLines:0];
    }
    return _addressLabel;
}

- (UIImageView *)avatarImageView
{
    if (_avatarImageView == nil) {
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _avatarImageView;
}

- (UILabel *)idLabel
{
    if (_idLabel == nil) {
        _idLabel = [[UILabel alloc] init];
        _idLabel.numberOfLines = 0;
        [_idLabel setFont:[UIFont boldSystemFontOfSize:16]];
    }
    return _idLabel;
}

@end
