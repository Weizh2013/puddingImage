//
//  LeftTableViewCell.m
//  pudding
//
//  Created by customer on 15/9/27.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import "LeftTableViewCell.h"

@interface LeftTableViewCell ()
{
    UIImageView *_indicateImageView;
}
@end

@implementation LeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _menuImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, height-20, height-20)];
        _indicateImageView = [[UIImageView alloc]initWithFrame:CGRectMake(width-height+10, 10, height-20, height-20)];
        _indicateImageView.image = [[UIImage imageNamed:@"home_anime_indicator~iphone"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _menuLabel = [[UILabel alloc]initWithFrame:CGRectMake(height+10, 0, width-2*height, height)];
        _menuLabel.textColor = [UIColor whiteColor];
    }
    [self.contentView addSubview:_menuLabel];
    [self.contentView addSubview:_menuImageView];
    [self.contentView addSubview:_indicateImageView];
    self.backgroundColor = [UIColor clearColor];
    return self;
}

- (void)layoutSubviews{
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;

    _menuLabel.frame = CGRectMake(height+10, 0, width-10-2*height, height);
    _indicateImageView.frame = CGRectMake(width-height+10, 10, height-20, height-20);
    _menuImageView.frame = CGRectMake(10, 10, height-20, height-20);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
