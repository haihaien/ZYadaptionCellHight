//
//  ZYTableViewCell.h
//  ZYCellHight
//
//  Created by LeMo-test on 16/8/11.
//  Copyright © 2016年 LeMo-test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYTableViewCell : UITableViewCell
@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UILabel *contentLable;

-(void)setContent:(NSString*)content;
/**
 内部操作算高度(法1)
 
 */
+(CGFloat)lastHightWithContent:(NSString*)titlt;
@end
