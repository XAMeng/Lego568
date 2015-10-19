//
//  OrderDetailViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/15.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "OrderDetailViewController.h"
#import "myOrder.h"
#import "orlist.h"
#import "UserTool.h"

@interface OrderDetailViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)myOrder *oder;
@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UserTool *tool = [[UserTool alloc] init];
    [tool getdetailmess:self.ordernum suceess:^(myOrder *myder) {
        self.oder = myder;
        [_tableview reloadData];
    }];
}



#pragma tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        
        return self.oder.listgoods.count;
    }
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if(section == 0){
        return @"商品列表";
    }else if(section == 1){
        return @"收货信息";
    }else
        return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        UILabel *numlabel = (UILabel *)[cell viewWithTag:11];
        numlabel.text = [NSString stringWithFormat:@"订单号：%@",self.oder.order_sn];
        UILabel *status = (UILabel *)[cell viewWithTag:12];
        status.text = [NSString stringWithFormat:@"订单状态：%@",self.oder.order_status_text];
        UILabel *paystatus = (UILabel *)[cell viewWithTag:13];
        paystatus.text = [NSString stringWithFormat:@"支付状态：%@",self.oder.order_pay_status_text];
        UILabel *price = (UILabel *)[cell viewWithTag:14];
        price.text = self.oder.order_amount;
        UIButton *button = (UIButton *)[cell viewWithTag:15];
        [button addTarget:self action:@selector(paymoney:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else if (indexPath.section == 1){
        orlist *list = [[orlist alloc] init];
        [list setvalueforlist:self.oder.listgoods[indexPath.row]];
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        UIImageView *imgview = (UIImageView *)[cell viewWithTag:16];
        [imgview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",ServerWeb,list.goods_imgs]] placeholderImage:[UIImage imageNamed:@"net_error_icon.png"]];
        UILabel *name = (UILabel *)[cell viewWithTag:17];
        name.text = list.goods_name;
        UILabel *p1 = (UILabel *)[cell viewWithTag:18];
        p1.text = list.goods_price;
        UILabel *p2 = (UILabel *)[cell viewWithTag:19];
        p2.text = list.goods_marke_price;
        return cell;
    }else if(indexPath.section == 2){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
        UILabel *person = (UILabel *)[cell viewWithTag:20];
        person.text = self.oder.order_consignee;
        UILabel *tel = (UILabel *)[cell viewWithTag:21];
        tel.text = self.oder.order_tel;
        UILabel *address = (UILabel *)[cell viewWithTag:22];
        address.text = [NSString stringWithFormat:@"收货地址：%@",self.oder.order_address];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell4" forIndexPath:indexPath];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 137;
    }else if (indexPath.section == 1){
        return 86;
    }else if(indexPath.section == 2){
        return 67;
    }else{
        return 40;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 20;
    }else if(section == 2)
        return 10;
    else
        return 30;
}
//在线支付
-(void)paymoney:(UIButton *)button{
    
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
