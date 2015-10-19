//
//  MycollectViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/16.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "MycollectViewController.h"
#import "UserTool.h"
#import "GoodsDetail.h"

@interface MycollectViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)NSArray *collectArray;

@end

@implementation MycollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UserTool *tool = [[UserTool alloc] init];
    [tool usid:self.uid sucess:^(NSArray *collect) {
        self.collectArray = collect;
        [_tableview reloadData];
    }];
    UIView *foot = [[UIView alloc] init];
    _tableview.tableFooterView = foot;
}


#pragma tableview 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.collectArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodsDetail *detail = self.collectArray[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UIImageView *imgview = (UIImageView *)[cell viewWithTag:11];
    [imgview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",ServerWeb,detail.goods_imgs]] placeholderImage:[UIImage imageNamed:@"net_error_icon.png"]];
    UILabel *name = (UILabel *)[cell viewWithTag:12];
    name.text = detail.goods_name;
    UILabel *price = (UILabel *)[cell viewWithTag:13];
    price.text = [NSString stringWithFormat:@"¥%@",detail.goods_price];
    UIButton *button =(UIButton *)[cell viewWithTag:14];
    [button addTarget:self action:@selector(canclecollect:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

//取消收藏按钮
-(void)canclecollect:(UIButton *)button{
    UserTool *tool = [[UserTool alloc] init];
    NSIndexPath *inedx =[self.tableview indexPathForCell:(UITableViewCell *)[button superview].superview];
    GoodsDetail *detail = self.collectArray[inedx.row];
    [tool CollectCancle:detail.collect_id sucess:^(NSString *result) {
        [tool usid:self.uid sucess:^(NSArray *collect) {
            self.collectArray = collect;
            [_tableview reloadData];
            
        }];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
