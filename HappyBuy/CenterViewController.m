//
//  CenterViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/12.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "CenterViewController.h"
#import "LogoinViewController.h"
#import "UserInfo.h"
#import "SetIMAGEViewController.h"
#import "MangerViewController.h"
#import "BuyCenterViewController.h"
#import "MycollectViewController.h"
#import "MyinformationViewController.h"

@interface CenterViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)UserInfo *uinfo;
@property (nonatomic,strong)UserLogin *ulogin;
@end

@implementation CenterViewController

//每次进入该界面就会调用
-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSData *data = [user objectForKey:@"OneUser"];
    _ulogin = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    if (!_ulogin.status) {
        [self SetVIewFortableview];
    }else{
        _uinfo = [[UserInfo alloc] init];
        [_uinfo SetValueForUserInfo:_ulogin.UserInforDic];
        [self HadLoginView];
    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //解档判断是否登录

    [self AddFootView];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadview) name:@"exit" object:nil];
}

-(void)reloadview{
    [self SetVIewFortableview];
}


//给tableview设置一个头VIew
-(void)SetVIewFortableview{
    UIView *headview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 180)];
    headview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"grzx_topbg.png"]];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(headview.bounds.size.width/2-30, headview.bounds.size.height/2-30, 60, 30);
    [button setTitle:@"登陆" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(ClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [headview addSubview:button];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(headview.bounds.size.width/2-50, headview.bounds.size.height/2, 120, 30)];
    label.text = @"您还没有登陆";
    label.tintColor = [UIColor whiteColor];
    [headview addSubview:label];
    _tableview.tableHeaderView = headview;
}
//如果登录了则返回另一个View
-(void)HadLoginView{
    
    UIView *headview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 180)];
    headview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"grzx_topbg.png"]];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 50, 30)];
    label1.font = [UIFont systemFontOfSize:14.0];
    label1.text = @"你好,";
    [headview addSubview:label1];
    
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(60, 40, 150, 30)];
    label4.text = _uinfo.user_name;
    [headview addSubview:label4];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 75, 30)];
    label2.font = [UIFont systemFontOfSize:14.0];
    label2.text = @"累计积分:";
    [headview addSubview:label2];
    
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(100, 75, 30, 20)];
    label5.text = [NSString stringWithFormat:@"%ld",(long)_uinfo.user_integral];
    [headview addSubview:label5];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(120, 75, 50, 20);
    [btn setTitle:_uinfo.vip forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [headview addSubview:btn];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 180, 30)];
    label3.text = [NSString stringWithFormat:@"%@",_uinfo.next_integral];
    label3.font = [UIFont systemFontOfSize:14.0];
    [headview addSubview:label3];
    _tableview.tableHeaderView = headview;
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(280, 45, 80, 20);
    [button setTitle:@"个人资料" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor brownColor];
    button.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [button addTarget:self action:@selector(toset:) forControlEvents:UIControlEventTouchUpInside];
    [headview addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(280, 105, 80, 20);
    [button1 setTitle:@"等级说明" forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor brownColor];
    button1.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [headview addSubview:button1];
}
-(void)toset:(UIButton *)button{
    [self performSegueWithIdentifier:@"toset" sender:self];
}
-(void)ClickButton:(UIButton *)button{
    [self performSegueWithIdentifier:@"cenlogin" sender:self];
}
-(void)AddFootView{
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 100)];
    footView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 10, 355, 40);
    [button setTitle:@"客服电话" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"flxx_tel.png"] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [footView addSubview:button];
    _tableview.tableFooterView = footView;
    button.backgroundColor = [UIColor orangeColor];
}

#pragma  tableview   ------代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
            return cell;
        }else if (indexPath.row == 1)
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
            return cell;
        }else {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
            return cell;
        }
    }else{
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell4" forIndexPath:indexPath];
            return cell;
        }else if (indexPath.row == 1)
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell5" forIndexPath:indexPath];
            return cell;
        }else {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell6" forIndexPath:indexPath];
            return cell;
        }
    }
}
//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self performSegueWithIdentifier:@"manger" sender:self];
        }else if(indexPath.row == 2){
            [self performSegueWithIdentifier:@"buycenter" sender:self];
        }
    }else{
        if (indexPath.row == 1) {
            [self performSegueWithIdentifier:@"mycollect" sender:self];
        }else if (indexPath.row == 2){
            [self performSegueWithIdentifier:@"mymess" sender:self];
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"订单管理";
    }else{
        return @"其他";
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toset"]) {
        SetIMAGEViewController *setimage = segue.destinationViewController;
        setimage.uinfo = self.uinfo;
        setimage.ulogin = self.ulogin;
    }else if([segue.identifier isEqualToString:@"manger"]){
        MangerViewController *manger = segue.destinationViewController;
        manger.info = self.uinfo;
    }else if ([segue.identifier isEqualToString:@"buycenter"]){
        BuyCenterViewController *buycenter = segue.destinationViewController;
        buycenter.uid =_uinfo.user_id;
    }else if([segue.identifier isEqualToString:@"mycollect"]){
        MycollectViewController *mycollectview = segue.destinationViewController;
        mycollectview.uid = _uinfo.user_id;
    }else if([segue.identifier isEqualToString:@"mymess"]){
        MyinformationViewController *informationview = segue.destinationViewController;
        informationview.uid = _uinfo.user_id;
    }else{
        LogoinViewController *logoin = segue.destinationViewController;
    }

    
}


@end
