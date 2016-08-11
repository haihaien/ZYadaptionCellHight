//
//  ViewController.m
//  ZYCellHight
//
//  Created by LeMo-test on 16/8/11.
//  Copyright © 2016年 LeMo-test. All rights reserved.
//

#import "ViewController.h"
#import "ZYTableViewCell.h"
#import "UITableViewCell+ZYCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong)  NSMutableArray *datasource;
@end

@implementation ViewController
-(NSMutableArray *)datasource
{
    if (!_datasource) {
        _datasource = [NSMutableArray array] ;
        
    }
    return _datasource;


}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        [self.view  addSubview:_tableView];
        [_tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[ZYTableViewCell class] forCellReuseIdentifier:@"ZYC"];
    self.datasource = [@[@"但是积分你就是快递费收到货发送的复活节送达回复即可撒旦法水电费和健康撒旦",@"搭建开发商的回复即可水电费华盛顿发圣诞节疯狂",@"发送的发货时打发空间换地方啥地方就拉萨的甲方是两地啥都解放了深刻的房间卡拉圣诞节福利萨克的房间里啥地方就快乐撒娇的法律是打飞机卡洛斯的积分ddnaf分撒旦积分女司机的开发水电费楼上的附近拉伸的啥都放假快乐圣诞节饭啥的就发了卡死的甲方是大家分开了水电费",@"打电话的空间是否是空间大粉红色的尽快发货圣诞节"]mutableCopy];
    // Do any additional setup after loading the view, typically from a nib.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYC" forIndexPath:indexPath];
    [cell setContent:self.datasource[indexPath.row]];
    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [ZYTableViewCell ZYtableView:tableView WithConfig:^(UITableViewCell *cell) {
        ZYTableViewCell *ZYcell = (ZYTableViewCell*)cell;
        [ZYcell setContent:self.datasource[indexPath.row]];
    }];
//    [ZYTableViewCell lastHightWithContent:self.datasource[indexPath.row]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
