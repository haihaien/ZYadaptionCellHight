//
//  UITableView+ZYReuseCells.m
//  ZYCellHight
//
//  Created by LeMo-test on 16/8/11.
//  Copyright © 2016年 LeMo-test. All rights reserved.
//

#import "UITableView+ZYReuseCells.h"
#import <objc/runtime.h>
const void *ZY_tableView_resumCell = @"ZY_tableView_resumCellKey";
@implementation UITableView (ZYReuseCells)
-(NSMutableDictionary *)reuseCells
{
    NSMutableDictionary *cells = objc_getAssociatedObject(self, ZY_tableView_resumCell);
    if (cells == nil) {
        cells = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, ZY_tableView_resumCell, cells, OBJC_ASSOCIATION_RETAIN);
    }
    return cells;

}

@end
