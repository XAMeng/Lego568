//
//  MangerViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/14.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "MangerViewController.h"
#import "myOrder.h"
#import "UserTool.h"
#import "OrderDetailViewController.h"
@interface MangerViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)NSArray *arr;
@property (nonatomic,strong)NSIndexPath *index;
@end

@implementation MangerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UserTool *utool = [[UserTool alloc] init];
    [utool getoederimgs:self.info.user_id success:^(NSArray *arr) {
        self.arr = arr;
        [_tableview reloadData];
    }];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    myOrder *odetail = self.arr[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    UILabel *numlabel = (UILabel *)[cell viewWithTag:11];
    numlabel.text = [NSString stringWithFormat:@"订单号：%@",odetail.order_sn];
    
    UILabel *pricelabel = (UILabel *)[cell viewWithTag:12];
    pricelabel.text = [NSString stringWithFormat:@"订单金额：%@",odetail.order_amount];
    
    UILabel *timelabel = (UILabel *)[cell viewWithTag:13];
    timelabel.text = [NSString stringWithFormat:@"下单时间：%@",odetail.order_edittime];
    
    UIButton *paybutton = (UIButton *)[cell viewWithTag:14];
    [paybutton setTitle:odetail.order_pay_status_text forState:UIControlStateNormal];
    [paybutton addTarget:self action:@selector(paymoney:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *cancel = (UIButton *)[cell viewWithTag:15];
    [cancel addTarget:self action:@selector(cancelbutton:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
//支付按钮
-(void)paymoney:(UIButton *)button{
    NSIndexPath *indexPath = [self.tableview indexPathForCell:(UITableViewCell *)[button superview].superview];
    self.index = indexPath;
    [self performSegueWithIdentifier:@"ordetail" sender:self];
}
//取消按钮
-(void)cancelbutton:(UIButton *)button{
    NSIndexPath *indexPath = [self.tableview indexPathForCell:(UITableViewCell *)[button superview].superview];
    myOrder *odetail = self.arr[indexPath.row];
    UserTool *utool = [[UserTool alloc] init];
    [utool cancelorder:odetail.order_sn sucess:^(NSString *cancel) {
        NSLog(@"%@",cancel);
        [utool getoederimgs:self.info.user_id success:^(NSArray *arr) {
            self.arr = arr;
            [_tableview reloadData];
        }];    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    OrderDetailViewController *odetail = segue.destinationViewController;
    myOrder *od = self.arr[self.index.row];
    odetail.ordernum = od.order_sn;
}


@end
