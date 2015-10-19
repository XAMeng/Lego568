//
//  goodTypeViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/7.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "goodTypeViewController.h"
#import "goodsTool.h"
#import "GoodsDetail.h"
#import "newView.h"
#import "goodsDetailViewController.h"
@interface goodTypeViewController ()
@property (nonatomic,strong)NSMutableArray *muArray;
@property (nonatomic,strong)NSArray *listType;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)newView *myview;
@property (nonatomic,assign)BOOL footRefresh;
@property (nonatomic,assign)int pagenum;
@end

@implementation goodTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.pagenum = 1;
    _myview = [[newView alloc] init];
    [self.view addSubview:_myview];
    _myview.hidden = YES;
    self.muArray = [NSMutableArray array];
  
    goodsTool *tool = [[goodsTool alloc] init];
    [tool getTypeImg:3 goods_type_id:self.goods_type_id city_id:2 list_order:self.list_order page_num:self.pagenum page_size:10 success:^(NSArray *array, NSArray *arr) {
        [self.muArray addObjectsFromArray:array];
        self.listType = arr;
        [_tableview reloadData];
    }];
    [self tableViewRefresh];
    if (self.footRefresh) {
        self.footRefresh = NO;
        [self.tableview footerEndRefreshing];//停止刷新
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getUserProfileSuccess:) name:@"Notification_GetUserProfileSuccess" object:nil];
}
//刷新
-(void)tableViewRefresh{
    if (self.footRefresh){
        return ;
    }else{
        __weak typeof (self)Myself = self;//解决循环引用问题。
        [_tableview addRefreshFooterViewWithAniViewClass:[JHRefreshAmazingAniView class] beginRefresh:^{
            Myself.footRefresh = YES;
            Myself.pagenum ++;
            goodsTool *tool = [[goodsTool alloc] init];
            [tool getTypeImg:3 goods_type_id:Myself.goods_type_id city_id:2 list_order:Myself.list_order page_num:Myself.pagenum page_size:10 success:^(NSArray *array, NSArray *arr) {
                [Myself.muArray addObjectsFromArray:array];
                [Myself.tableview reloadData];//刷新tablewview
                if (self.footRefresh) {
                    self.footRefresh = NO;
                    [self.tableview footerEndRefreshing];//停止刷新
                }
            }];
        }];

    }
    
}


-(void)getUserProfileSuccess:(NSNotification*) aNotification{
    NSString *goodid = [aNotification object];
    self.goods_type_id =[goodid intValue];
    goodsTool *tool = [[goodsTool alloc] init];
    [tool getTypeImg:3 goods_type_id:self.goods_type_id city_id:2 list_order:self.list_order page_num:1 page_size:10 success:^(NSArray *array, NSArray *arr) {
        [self.muArray addObjectsFromArray:array];
        self.listType = arr;
        [_tableview reloadData];
    }];
}

//排序按钮点击事件
- (IBAction)btnClick:(UIButton *)sender {
    for (int i=1 ; i <= 3; i ++) {
        if (sender.tag == i) {
            sender.backgroundColor = [UIColor groupTableViewBackgroundColor];
        }else{
            UIButton *button = (UIButton *)[self.view viewWithTag:i];
            button.backgroundColor = [UIColor whiteColor];
        }
    }
    self.list_order = (int)sender.tag;
    goodsTool *tool = [[goodsTool alloc] init];
    [tool getTypeImg:3 goods_type_id:self.goods_type_id city_id:2 list_order:self.list_order page_num:1 page_size:10 success:^(NSArray *array, NSArray *arr) {
        self.muArray = [NSMutableArray array];
        [self.muArray addObjectsFromArray:array];
        self.listType = arr;
        [_tableview reloadData];
    }];
}
- (IBAction)typebutton:(UIButton *)sender {
    if (_myview.hidden== YES) {
        _myview.hidden = NO;

    }else{
        _myview.hidden = YES;
       
    }
}


#pragma tableView --- 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.muArray.count;
}


//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodsDetail *detail = self.muArray[indexPath.row];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Notification" object:detail userInfo:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    GoodsDetail *detail = self.muArray[indexPath.row];
    UIImageView *imgview = (UIImageView *)[cell viewWithTag:10];
    [imgview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerWeb,detail.goods_imgs]] placeholderImage:[UIImage imageNamed:@"net_error_icon.png"]];
    UILabel *title = (UILabel *)[cell viewWithTag:11];
    title.text = detail.goods_title;
    UILabel *money = (UILabel *)[cell viewWithTag:12];
    money.text = [NSString stringWithFormat:@"¥%@",detail.goods_price];
    UILabel *salen = (UILabel *)[cell viewWithTag:13];
    salen.text = [NSString stringWithFormat:@"%d人付款",detail.goods_sales];
    UILabel *time = (UILabel *)[cell viewWithTag:14];
    NSArray *arr = [detail.goods_addtime componentsSeparatedByString:@" "];
    time.text = arr[0];
    return cell;
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
