//
//  UITableViewCell+ZYCell.m
//  ZYCellHight
//
//  Created by LeMo-test on 16/8/11.
//  Copyright © 2016年 LeMo-test. All rights reserved.
//

#import "UITableViewCell+ZYCell.h"
#import "UITableView+ZYReuseCells.h"
#import <objc/runtime.h>
const void *ZYCellBottomViewCellKey = @"ZYCellBottomViewCellKey";
const void  * ZYCellBottomSpaceKey = @"ZYCellBottomSpaceKey";
@implementation UITableViewCell (ZYCell)
+(CGFloat)ZYtableView:(UITableView *)tableView WithConfig:(cellBlock)config
{
    UITableViewCell *cell = [tableView.reuseCells objectForKey:[[self class] description]];
    if (cell == nil) {
        cell = [[self alloc] init];
        [tableView.reuseCells setObject:cell forKey:[[self class] description]];
    }
    if (config) {
        config(cell);
        //注意这边cell要重新赋值和刷新布局
    }

    return [cell ZYlasteCellHight];
}



/**
 返回高度
 */
-(CGFloat)ZYlasteCellHight
{
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGFloat height = self.ZYCellBottomView.frame.origin.y+self.ZYCellBottomView.frame.size.height +self.ZYCellBottomSpace;
    return height;
}

#pragma  mark - Set AND GET
-(void)setZYCellBottomView:(UIView *)ZYCellBottomView
{
    objc_setAssociatedObject(self, ZYCellBottomViewCellKey, ZYCellBottomView, OBJC_ASSOCIATION_RETAIN);
}

-(UIView *)ZYCellBottomView
{
return    objc_getAssociatedObject(self, ZYCellBottomViewCellKey);

}
-(void)setZYCellBottomSpace:(CGFloat)ZYCellBottomSpace
{
    objc_setAssociatedObject(self, ZYCellBottomSpaceKey, @(ZYCellBottomSpace), OBJC_ASSOCIATION_ASSIGN);
    
}
-(CGFloat)ZYCellBottomSpace
{
    NSNumber *objValue = objc_getAssociatedObject(self, ZYCellBottomSpaceKey);
    if ([objValue respondsToSelector:@selector(floatValue)]) {
        return objValue.floatValue;
    }
    return 0.0;
}



@end
