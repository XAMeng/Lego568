//
//  BuyNowViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/8.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "BuyNowViewController.h"
#import "UserLogin.h"
#import "UserInfo.h"
#import "OrderDetailViewController.h"

@interface BuyNowViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)UserInfo *info;
@property (weak, nonatomic) IBOutlet UILabel *labe;
@property (nonatomic,assign)float sumPri;
@property (nonatomic,strong)NSString *OrderNumber;

@end

@implementation BuyNowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _sumPri = 0;
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSData *data = [user objectForKey:@"OneUser"];
    UserLogin *ulogin = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSDictionary *dic = ulogin.UserInforDic;
    self.info = [[UserInfo alloc] init];
    [self.info SetValueForUserInfo:dic];
    
   
    UIView *footview = [[UIView alloc] init];
    _tableview.tableFooterView = footview;
}

#pragma tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.listArray.count == 0) {
        if (section == 0) {
            return 2;
        }else
            return 3;
    }else{
        if (section == 0) {
            return 1+self.listArray.count;
        }else
            return 3;
    }

}
//提交订单
- (IBAction)ConfimOrder:(UIButton *)sender {
    UserTool *tool = [[UserTool alloc] init];
    if (self.listArray.count ) {
        orlist *list = [[orlist alloc] init];
        NSMutableArray *goodidArray = [NSMutableArray array];
        for (list in self.listArray) {
            [goodidArray addObject:[NSString stringWithFormat:@"%d",list.goods_id]];
        }
        NSString *goodsid = [goodidArray componentsJoinedByString:@","];
        [tool Submit:self.info.user_name address:self.info.user_address tel:self.info.user_phone remarks:@"" uid:self.info.user_id payid:1 delivery:1 gid:[NSString stringWithFormat:@"%@",goodsid] sucess:^(NSString *result) {
            NSLog(@"%@",result);
            self.OrderNumber = result;
            [self performSegueWithIdentifier:@"toOd" sender:self];
        }];
    }else{
        [tool Submit:self.info.user_name address:self.info.user_address tel:self.info.user_phone remarks:@"" uid:self.info.user_id payid:1 delivery:1 gid:[NSString stringWithFormat:@"%d",self.detail.goods_id] sucess:^(NSString *result) {
            NSLog(@"%@",result);
            self.OrderNumber = result;
             [self performSegueWithIdentifier:@"toOd" sender:self];
        }];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        if (self.listArray.count == 0) {
            if (indexPath.row == 0) {
                return 94;
            }
        }else{
            if (indexPath.row < self.listArray.count ) {
                return 94;
            }
        }

    }
    else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            return 72;
        }
    }
    return 43;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UIView *secview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 30)];
        secview.backgroundColor = [UIColor groupTableViewBackgroundColor];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 20)];
        label.text = @"订单详情";
        [secview addSubview:label];
        return secview;
    }else{
        UIView *secview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 30)];
        secview.backgroundColor = [UIColor groupTableViewBackgroundColor];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 100, 20)];
        label.text = @"送货地址";
        [secview addSubview:label];
        return secview;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            if (self.listArray.count == 0) {
                if (indexPath.row == 0) {
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"maincell" forIndexPath:indexPath];
                    UIImageView *imgview = (UIImageView *)[cell viewWithTag:10];
                    [imgview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerWeb,self.detail.goods_imgs]] placeholderImage:[UIImage imageNamed:@"net_error_icon.png"]];
                    UILabel *title = (UILabel *)[cell viewWithTag:11];
                    title.text = self.detail.goods_title;
                    UILabel *numlab = (UILabel *)[cell viewWithTag:12];
                    numlab.text = [NSString stringWithFormat:@"x%d",self.number];
                    UILabel *prclab = (UILabel *)[cell viewWithTag:13];
                    prclab.text = self.detail.goods_price;
                    UILabel *prclab2 = (UILabel *)[cell viewWithTag:14];
                    prclab2.text = self.detail.goods_marke_price;
                    return cell;
                }else{
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sumprice" forIndexPath:indexPath];
                    UILabel *label = (UILabel *)[cell viewWithTag:21];
                    int prc = [self.detail.goods_price intValue];
                    label.text = [NSString stringWithFormat:@"%d",self.number*prc];
                    return cell;
                }
            }else{
                
                
                if (indexPath.row < self.listArray.count) {
                    orlist *list = self.listArray[indexPath.row];
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"maincell" forIndexPath:indexPath];
                    UIImageView *imgview = (UIImageView *)[cell viewWithTag:10];
                    [imgview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerWeb,list.goods_imgs]] placeholderImage:[UIImage imageNamed:@"net_error_icon.png"]];
                    UILabel *title = (UILabel *)[cell viewWithTag:11];
                    title.text = list.goods_name;
                    UILabel *numlab = (UILabel *)[cell viewWithTag:12];
                    numlab.text = [NSString stringWithFormat:@"x%@",list.goods_number];
                    UILabel *prclab = (UILabel *)[cell viewWithTag:13];
                    prclab.text = list.goods_price;
                    UILabel *prclab2 = (UILabel *)[cell viewWithTag:14];
                    prclab2.text = list.goods_marke_price;
                    _sumPri += [list.goods_price intValue]*[list.goods_number intValue];
                    return cell;
                }else{
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sumprice" forIndexPath:indexPath];
                    UILabel *label = (UILabel *)[cell viewWithTag:21];
                    label.text = [NSString stringWithFormat:@"%0.1f",self.sumPri];
                    _labe.text = [NSString stringWithFormat:@"合计：¥%0.1f",_sumPri+5];
                    return cell;
                }
            }

        }
            break;
            
        default:
        {
            if (indexPath.row == 0) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"adress" forIndexPath:indexPath];
                UILabel *lab1 = (UILabel *)[cell viewWithTag:31];
                lab1.text = self.info.user_name;
                UILabel *lab2 = (UILabel *)[cell viewWithTag:32];
                lab2.text = self.info.user_phone;
                UILabel *lab3 = (UILabel *)[cell viewWithTag:33];
                if ([self.info.user_address isEqual:[NSNull null]] && [self.info.user_address2 isEqual:[NSNull null]]) {
                    lab3.text = @"暂无收获地址";
                }else{
                    lab3.text = self.info.user_address;
                }
                return cell;
            }else if (indexPath.row == 1){
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pay" forIndexPath:indexPath];
                return cell;
            }else{
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"send" forIndexPath:indexPath];
                return cell;
            }
        }
            break;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    OrderDetailViewController *orderdetailview = segue.destinationViewController;
    orderdetailview.ordernum = self.OrderNumber;
}


@end
