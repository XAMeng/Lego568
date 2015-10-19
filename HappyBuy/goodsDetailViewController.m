//
//  goodsDetailViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/6.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "goodsDetailViewController.h"
#import "goodsTool.h"
#import "GoodsDetail.h"
#import "shopContent.h"
#import "goodTypeViewController.h"
#import "BuyNowViewController.h"
#import "UserInfo.h"
@interface goodsDetailViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)GoodsDetail *detail;
@property (weak, nonatomic) IBOutlet UITableView *tabview;
@property (nonatomic,strong)UIPageControl *PageC;
@property (nonatomic,assign)int number;
@property (nonatomic,assign)BOOL isOpen;

@end

@implementation goodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.isOpen = NO;
    self.number = 1;
    goodsTool *tool = [[goodsTool alloc] init];
    [tool getDetailGoods:self.goodid success:^(GoodsDetail *goodDetail) {
        self.detail = goodDetail;
        [self SetTabHeadView];
        [_tabview reloadData];
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getUserProfileSuccess:) name:@"Notification" object:nil];
}
-(void)getUserProfileSuccess:(NSNotification *)notify{
    GoodsDetail *detail = [notify object];
    self.goodid = detail.goods_id;
    goodsTool *tool = [[goodsTool alloc] init];
    [tool getDetailGoods:self.goodid success:^(GoodsDetail *goodDetail) {
        self.detail = goodDetail;
        [self SetTabHeadView];
        [_tabview reloadData];
    }];
}
//立即购买&加入购物车
- (IBAction)buynow:(id)sender {
    [self performSegueWithIdentifier:@"tobuy" sender:self];
}
- (IBAction)addtocar:(id)sender {
    UserTool *utool = [[UserTool alloc] init];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSData *data = [user objectForKey:@"OneUser"];
    UserLogin *ulogin = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    UserInfo *uinfo = [[UserInfo alloc] init];
    [uinfo SetValueForUserInfo:ulogin.UserInforDic];
    [utool AddBuyCar:self.detail.goods_id userid:uinfo.user_id goodnumber:self.number success:^(NSString *content) {
        NSLog(@"%@",content);
    }];
}

-(void)SetTabHeadView{
    NSArray *imgArray = self.detail.goods_imgs_new;
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 170)];
    //加载UIScrollView
    UIScrollView *ScroView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Width, 170)];
    [ScroView setContentSize:CGSizeMake(Width *imgArray.count, 170)];
    ScroView.pagingEnabled = YES;
    ScroView.showsHorizontalScrollIndicator = NO;
    ScroView.showsVerticalScrollIndicator = NO;
    ScroView.delegate = self;
    for (int i = 0; i < imgArray.count; i ++) {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(Width*i, 0, Width, 170)];
        NSDictionary *dic = imgArray[i];
        [imgV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",ServerWeb,dic[@"img"]]] placeholderImage:[UIImage imageNamed:@"net_error_icon.png"]];
        [ScroView addSubview:imgV];
    }
    [headView addSubview:ScroView];
    //设置一个蒙版
    UIView *downView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, Width, 20)];
    downView.backgroundColor = [UIColor blackColor];
    downView.alpha = 0.4;
    [headView addSubview:downView];
    //加载一个UIPageControl
    _PageC = [[UIPageControl alloc] initWithFrame:CGRectMake(130, 150, Width, 20)];
    _PageC.numberOfPages = imgArray.count;
    _PageC.pageIndicatorTintColor = [UIColor orangeColor];
    _PageC.currentPageIndicatorTintColor = [UIColor whiteColor];
    _PageC.tag = 50;
    [headView addSubview:_PageC];
    _tabview.tableHeaderView = headView;
}


#pragma tableView ----代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.isOpen == NO) {
        return 3;
    }
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }else if(section == 1){
        return 2;
    }else if(section == 2){
        if (self.isOpen == NO) {
            return 1;
        }
        return 2;
    }else if(section == 3){
        return 1;
    }else
        return 2;
}
//每块的距离
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
//设置每行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 39;
            break;
        case 1:
        {
            if (indexPath.row == 0 )
                return 39;
            else
                return 56;
        }
        case 2:
        {
            if (indexPath.row == 0)
                return 39;
            else
                return 64;
        }
        case 3:
        {
            return 64;
        }
            
        default:
            if (indexPath.row  == 0) {
                return 39;
            }else
                return 100;
            break;
    }
}
//cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2 && indexPath.row == 0) {
        if (self.isOpen == NO) {
            UITableViewCell *cell = [self.tabview cellForRowAtIndexPath:indexPath];
            UIImageView *img = (UIImageView *)[cell viewWithTag:25];
            img.image = [UIImage imageNamed:@"arrow_up.png"];
            self.isOpen = YES;
            [_tabview reloadData];
        }else{
            UITableViewCell *cell = [self.tabview cellForRowAtIndexPath:indexPath];
            UIImageView *img = (UIImageView *)[cell viewWithTag:25];
            img.image = [UIImage imageNamed:@"arrow_down.png"];
            self.isOpen = NO;
            [_tabview reloadData];
        }
    }
     if (indexPath.section == 0 &&indexPath.row ==1) {
        [self performSegueWithIdentifier:@"togoodtype" sender:self];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
            ////////////////////第一块
        case 0:
        {
            if (indexPath.row == 0) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"title" forIndexPath:indexPath];
                UILabel *label = (UILabel *)[cell viewWithTag:11];
                label.text = self.detail.goods_title;
                UIButton *btn = (UIButton *)[cell viewWithTag:12];
                [btn addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
                return cell;
            }else if (indexPath.row == 1){
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"type" forIndexPath:indexPath];
                
                UILabel *label = (UILabel *)[cell viewWithTag:21];
                label.text = self.detail.goods_typename;

                return cell;
            }else if (indexPath.row == 2){
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"price" forIndexPath:indexPath];
                UILabel *price = (UILabel *)[cell viewWithTag:31];
                price.text = [NSString stringWithFormat:@"%@元",self.detail.goods_price];
                UILabel *marketprice = (UILabel *)[cell viewWithTag:32];
                marketprice.text = [NSString stringWithFormat:@"%@元",self.detail.goods_marke_price];
                UIButton *downbtn = (UIButton *)[cell viewWithTag:34];
                UIButton *upbtn = (UIButton *)[cell viewWithTag:36];
                
                [downbtn addTarget:self action:@selector(numberLow:) forControlEvents:UIControlEventTouchUpInside];
                [upbtn addTarget:self action:@selector(numberUp:) forControlEvents:UIControlEventTouchUpInside];
                return cell;
            }else  {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jifen" forIndexPath:indexPath];
                UILabel *label = (UILabel *)[cell viewWithTag:5];
                label.text = [NSString stringWithFormat:@"购买可以获得%@积分",self.detail.goods_price];
                return cell;
            }
        }
            break;
            ////////////////////第二块
            case 1:
        {
            if (indexPath.row == 0) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"produce" forIndexPath:indexPath];
                return cell;
            }else {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"content" forIndexPath:indexPath];
                UILabel *label = (UILabel *)[cell viewWithTag:8];
                label.text = self.detail.goods_content;
                return cell;
            }
                
        }
            break;
            ////////////////////第三块
            case 2:
        {
            if (indexPath.row == 0) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"intro" forIndexPath:indexPath];
                return cell;
            }else{
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"store" forIndexPath:indexPath];
                UILabel *lab1 = (UILabel *)[cell viewWithTag:51];
                UILabel *lab2 = (UILabel *)[cell viewWithTag:52];
                shopContent *content = [[shopContent alloc] init];
                [content SetValueForShopContent:self.detail.contentShop];
                lab1.text = content.shop_name;
                lab2.text = content.shop_address;
                return cell;
            }
        }
            break;
            ////////////////////第四块
            case 3:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Conect" forIndexPath:indexPath];
            UILabel *lab1 = (UILabel *)[cell viewWithTag:53];
            UILabel *lab2 = (UILabel *)[cell viewWithTag:54];
            shopContent *content = [[shopContent alloc] init];
            [content SetValueForShopContent:self.detail.contentShop];
            lab1.text = [NSString stringWithFormat:@"联系人：%@",content.shop_contact];
            lab2.text = [NSString stringWithFormat:@"电话：%@",content.shop_tel];
            return cell;
        }
            break;
            ////////////////////第五块
        default:
            if (indexPath.row == 0) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"company" forIndexPath:indexPath];
                return cell;
            }else{
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"introduce" forIndexPath:indexPath];
                shopContent *content = [[shopContent alloc] init];
                [content SetValueForShopContent:self.detail.contentShop];
                UILabel *label = (UILabel *)[cell viewWithTag:15];
                label.text = content.shop_about;
                return cell;
            }
            break;
    }
}

//添加收藏
-(void)collect:(UIButton *)button{
    UserTool *utool = [[UserTool alloc] init];
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSData *data = [user objectForKey:@"OneUser"];
    UserLogin *ulogin = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    UserInfo *uinfo = [[UserInfo alloc] init];
    [uinfo SetValueForUserInfo:ulogin.UserInforDic];
    
    [utool AddCollect:self.detail.goods_id userid:uinfo.user_id success:^(NSString *content, BOOL status) {
        NSLog(@"收藏成功");
    }];
    
}

-(void)numberLow:(UIButton *)button{
    if (self.number >1) {
        NSIndexPath *indexPath = [self.tabview indexPathForCell:(UITableViewCell *)[button superview].superview];
        UITableViewCell *cell = [self.tabview cellForRowAtIndexPath:indexPath];
        UILabel *label = (UILabel *)[cell viewWithTag:35];
        self.number --;
        label.text = [NSString stringWithFormat:@"%d",self.number];
        [_tabview reloadData];
    }

}
-(void)numberUp:(UIButton *)button{
    if (self.number <99) {
        NSIndexPath *indexPath = [self.tabview indexPathForCell:(UITableViewCell *)[button superview].superview];
        UITableViewCell *cell = [self.tabview cellForRowAtIndexPath:indexPath];
        UILabel *label = (UILabel *)[cell viewWithTag:35];
        self.number ++;
        label.text = [NSString stringWithFormat:@"%d",self.number];
        [_tabview reloadData];
    }
}
#pragma scroview代理
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int index = scrollView.contentOffset.x/scrollView.frame.size.width;
    _PageC.currentPage = index;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"tobuy"]) {
        BuyNowViewController *buynow = segue.destinationViewController;
        buynow.detail = self.detail;
        buynow.number = self.number;
        
    }else{
        goodTypeViewController *goodtype = segue.destinationViewController;
        goodtype.goods_type_id = 23;
        goodtype.list_order = 1;
    }
}


@end
