//
//  UITableView+ZYReuseCells.h
//  ZYCellHight
//
//  Created by LeMo-test on 16/8/11.
//  Copyright © 2016年 LeMo-test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (ZYReuseCells)
/**
 所有注册的cell
 */
@property (nonatomic, strong, readonly) NSMutableDictionary *reuseCells;
@end
