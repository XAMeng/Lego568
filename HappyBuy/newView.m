//
//  newView.m
//  HappyBuy
//
//  Created by echo24 on 15/10/8.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "newView.h"
#import "goodsTool.h"
#import "fenleiTableViewCell.h"
#import "GoodsDetail.h"
#import "goodTypeViewController.h"
@interface newView()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)NSArray *arr;
@property (nonatomic,assign)int goods_type_id;

@end
@implementation newView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {

        [self addcontent];
        goodsTool *tool = [[goodsTool alloc] init];
        [tool getTypeImg:3 goods_type_id:23 city_id:2 list_order:1 page_num:1 page_size:10 success:^(NSArray *array, NSArray *arr) {
            self.arr = arr;
            [_tableview reloadData];
        }];
        
    }
    return self;
}
-(void)addcontent{
    self.frame = CGRectMake(281, 94, 93, 120);
    
    self.backgroundColor = [UIColor blackColor];
    self.alpha = 0.4;
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 93, 120) style:UITableViewStylePlain];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    _tableview.backgroundColor = [UIColor blackColor];
    [self addSubview:_tableview];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
//view的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodsDetail *detail = self.arr[indexPath.row];
    NSString *data = [NSString stringWithFormat:@"%d",detail.goods_type_id];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Notification_GetUserProfileSuccess" object:data userInfo:nil];
    self.hidden = YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    fenleiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    if (!cell) {
        cell = [[fenleiTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
    GoodsDetail *detail = self.arr[indexPath.row];
    UILabel *label = (UILabel *)[cell viewWithTag:30];
    label.text = detail.goods_type_name;
    cell.backgroundColor = [UIColor blackColor];
    return cell;
}


@end
