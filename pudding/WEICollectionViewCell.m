//
//  WEICollectionViewCell.m
//  pudding
//
//  Created by apple on 15/9/29.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import "WEICollectionViewCell.h"
@interface WEICollectionViewCell ()
{
    UIImageView *_imageView;
    UILabel *_maskLabel;
}
@end

@implementation WEICollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    self.backgroundColor = [UIColor clearColor];
    return self;
}

- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width)];
        [self addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)maskLabel{
    if (_maskLabel == nil) {
        _maskLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.bounds.size.width, self.bounds.size.width, self.bounds.size.height-self.bounds.size.width)];
        _maskLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_maskLabel];
    }
    return _maskLabel;
}

@end
