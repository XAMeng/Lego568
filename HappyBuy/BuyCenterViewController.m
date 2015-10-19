//
//  BuyCenterViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/15.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "BuyCenterViewController.h"
#import "orlist.h"
#import "UserTool.h"
#import "EditGoodsNumViewController.h"
#import "BuyNowViewController.h"

@interface BuyCenterViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UILabel *sumprice;
@property (nonatomic,strong)NSArray *array;
@property (nonatomic,assign)float gprice;
@property (nonatomic,strong)NSIndexPath *index;
@property (nonatomic,strong)EditGoodsNumViewController *editview;
@property (nonatomic,strong)UIView *backview;
@property (nonatomic,strong)NSMutableArray *muArray;

@end

@implementation BuyCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.muArray = [NSMutableArray array];
    _gprice = 0.0;
    _sumprice.text = [NSString stringWithFormat:@"%0.1f",_gprice];;
    UserTool *tool = [[UserTool alloc] init];
    [tool buycarcenter:self.uid sucess:^(NSArray *array) {
        self.array = array;
        [_tableview reloadData];
    }];
    UIView *footview = [[UIView alloc] init];
    _tableview.tableFooterView = footview;
    _editview = [self.storyboard instantiateViewControllerWithIdentifier:@"editnum"];
    [self addChildViewController:_editview];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatanumber:) name:@"goodnumber" object:nil];
}
//传过来的通知
-(void)updatanumber:(NSNotification *)notify{
    orlist *list = [notify object];
    UITableViewCell *cell = [self.tableview cellForRowAtIndexPath:self.index];
    UILabel *num = (UILabel *)[cell viewWithTag:15];
    num.text = list.goods_number;
    _sumprice.text = [NSString stringWithFormat:@"0.0"];
    [self.backview removeFromSuperview];
    for (int i = 0; i<self.array.count;i ++ ) {
        UITableViewCell *cell = [self.tableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        UIButton *btn = (UIButton *)[cell viewWithTag:10];
        btn.selected =NO;
    }
}

#pragma tableview ----delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    orlist *list = self.array[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UIButton *selcetbtn = (UIButton *)[cell viewWithTag:10];
    [selcetbtn addTarget:self action:@selector(selectedbtn:) forControlEvents:UIControlEventTouchUpInside];
    UILabel *name = (UILabel *)[cell viewWithTag:12];
    name.text = list.goods_name;
    UILabel *price = (UILabel *)[cell viewWithTag:13];
    price.text = [NSString stringWithFormat:@"商品价格：¥%@",list.goods_price];
    UILabel *markprice = (UILabel *)[cell viewWithTag:14];
    markprice.text = [NSString stringWithFormat:@"市场价格：¥%@",list.goods_marke_price];
    UILabel *num = (UILabel *)[cell viewWithTag:15];
    num.text = [NSString stringWithFormat:@"购买数量：¥%@",list.goods_number];
    
    UIImageView *imgview = (UIImageView *)[cell viewWithTag:11];
    [imgview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",ServerWeb,list.goods_imgs]] placeholderImage:[UIImage imageNamed:@"net_error_icon.png"]];
    UIButton *editbtn = (UIButton *)[cell viewWithTag:16];
    [editbtn addTarget:self action:@selector(editBtn:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *deletebtn = (UIButton *)[cell viewWithTag:17];
    [deletebtn addTarget:self action:@selector(deletebtn:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
//选中按钮点击事件
-(void)selectedbtn:(UIButton *)button{
    if (button.selected == NO) {
        button.selected = YES;
        NSIndexPath *indexPath = [self.tableview indexPathForCell:(UITableViewCell *)[button superview].superview];
       orlist *list = self.array[indexPath.row];
        _gprice += [list.goods_number intValue] *[list.goods_price intValue];
        _sumprice.text = [NSString stringWithFormat:@"%0.1f",_gprice];
        
    }else{
        NSIndexPath *indexPath = [self.tableview indexPathForCell:(UITableViewCell *)[button superview].superview];
        orlist *list = self.array[indexPath.row];
        _gprice -= [list.goods_number intValue] *[list.goods_price intValue];
        _sumprice.text = [NSString stringWithFormat:@"%0.1f",_gprice];
        button.selected = NO;
    }
}
//编辑按钮
-(void)editBtn:(UIButton *)button{
    self.index = [self.tableview indexPathForCell:(UITableViewCell*)[button superview].superview];
    orlist *list = self.array[self.index.row];
    _editview.list = list;
  
    _backview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
    _backview.backgroundColor = [UIColor blackColor];
    _backview.alpha = 0.3;
    [self.view addSubview:_backview];
    _editview.view.frame = CGRectMake(10, Height/2, Width-20, 100);
    [self.view addSubview:_editview.view];
}
//删除按钮
-(void)deletebtn:(UIButton *)button{
    NSIndexPath *index = [self.tableview indexPathForCell:(UITableViewCell*)[button superview].superview];
    orlist *list = self.array[index.row];
    _editview.list = list;
    UserTool *tool = [[UserTool alloc] init];
    [tool deleteGoods:list.goods_id userid:list.user_id sucess:^(NSString *result) {
        NSLog(@"%@",result);
        UserTool *tool = [[UserTool alloc] init];
        [tool buycarcenter:self.uid sucess:^(NSArray *array) {
            self.array = array;
            [_tableview reloadData];
        }];
    }];
;
}

//全选按钮
- (IBAction)SelectAll:(UIButton *)sender {
    _gprice = 0.0;
    
    if (sender.selected == NO) {
        for (int i = 0; i<self.array.count;i ++ ) {
            UITableViewCell *cell = [self.tableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            UIButton *btn = (UIButton *)[cell viewWithTag:10];
            btn.selected =YES;
            orlist *list = self.array[i];
            _gprice += [list.goods_number intValue] *[list.goods_price intValue];
        }
        _sumprice.text = [NSString stringWithFormat:@"%0.1f",_gprice];
        sender.selected = YES;
    }else{
        for (int i = 0; i<self.array.count;i ++ ) {
            UITableViewCell *cell = [self.tableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            UIButton *btn = (UIButton *)[cell viewWithTag:10];
            btn.selected =NO;
        }
        _gprice = 0.0;
        _sumprice.text = @"0.0";
        sender.selected = NO;
    }

}
//结账按钮
- (IBAction)paymoney:(UIButton *)sender {
    for (int i = 0; i<self.array.count;i ++ ) {
        UITableViewCell *cell = [self.tableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        UIButton *btn = (UIButton *)[cell viewWithTag:10];
        if (btn.selected ==YES) {
            orlist *list = self.array[i];
            [self.muArray addObject:list];
            
        }
    }
    [self performSegueWithIdentifier:@"jiesuan" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BuyNowViewController *buynowview = segue.destinationViewController;
    buynowview.listArray = self.muArray;
}


@end
