//
//  UITableViewCell+ZYCell.h
//  ZYCellHight
//
//  Created by LeMo-test on 16/8/11.
//  Copyright © 2016年 LeMo-test. All rights reserved.
//
#import <UIKit/UIKit.h>
typedef void(^cellBlock)(UITableViewCell *cell);

@interface UITableViewCell (ZYCell)
/**
 cell里面下边距
 */
@property (nonatomic, assign) CGFloat ZYCellBottomSpace;
/**
 cell里面做下面的View
 */
@property (nonatomic, strong) UIView *ZYCellBottomView;
/**
 计算cell的高度
 */
+(CGFloat)ZYtableView:(UITableView*)tableView WithConfig:(cellBlock)config;
@end
