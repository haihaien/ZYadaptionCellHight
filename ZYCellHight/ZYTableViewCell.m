//
//  ZYTableViewCell.m
//  ZYCellHight
//
//  Created by LeMo-test on 16/8/11.
//  Copyright © 2016年 LeMo-test. All rights reserved.
//

#import "ZYTableViewCell.h"
#import "UITableViewCell+ZYCell.h"
@implementation ZYTableViewCell
-(UIView *)view
{
    if (!_view) {
        _view = [[UIView alloc] init];
        _view.backgroundColor = [UIColor redColor];
        [self.contentView  addSubview:_view];
    }
    return _view;

}
-(UILabel *)contentLable
{
    if (!_contentLable) {
        _contentLable = [[UILabel alloc] init];
        _contentLable.numberOfLines = 0;
        _contentLable.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width-20;
        [self.contentView  addSubview:_contentLable];
    }
    return _contentLable;

}

-(void)setContent:(NSString *)content
{
    [self setlastcontent:content];
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    self.ZYCellBottomSpace = 10;
    self.ZYCellBottomView = self.contentLable;

}
-(void)updateConstraints
{
[self.view mas_updateConstraints:^(MASConstraintMaker *make) {
    make.top.mas_equalTo(10);
    make.left.mas_equalTo(10);
    make.right.mas_equalTo(-10);
    make.height.mas_equalTo(30);
}];
 [self.contentLable mas_updateConstraints:^(MASConstraintMaker *make) {
     make.top.mas_equalTo(self.view.mas_bottom).offset(10);
     make.left.mas_equalTo(10);
     make.right.mas_equalTo(-10);
    
 }];

    [super updateConstraints];
}
-(void)setlastcontent:(NSString*)content
{
    self.contentLable.text = content;

}
+(CGFloat)lastHightWithContent:(NSString *)titlt
{
    static ZYTableViewCell *cell;
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken, ^{
        cell = [[ZYTableViewCell alloc] init];
    });
    [cell setContent:titlt];
    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    CGRect frame = cell.contentLable.frame;
    return frame.origin.y +frame.size.height+20;

}
@end
