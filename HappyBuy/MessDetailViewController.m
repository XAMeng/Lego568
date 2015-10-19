//
//  MessDetailViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/9.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "MessDetailViewController.h"
#import "message.h"
#import "Detail_Info.h"
#import "PushViewController.h"
@interface MessDetailViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)Detail_Info *detail;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (nonatomic,strong)UIPageControl *PageC;
@end

@implementation MessDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    message *mage = [[message alloc] init];
    [mage getMessDetail:self.info_id success:^(Detail_Info *det_info) {
        self.detail = det_info;
        [self SetTabHeadView];
        [_tableview reloadData];
    }];
    self.name.text = self.detail.info_contact;
    self.phone.text = self.detail.info_tel;
}

-(void)SetTabHeadView{
    NSArray *Array = self.detail.info_imgs_new;
    NSMutableArray *imgArray = [NSMutableArray array];
    for (NSDictionary *imgdic in Array) {
        NSString *imgurl = imgdic[@"img"];
        [imgArray addObject:imgurl];
    }
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
        
        [imgV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerWeb,imgArray[i]]] placeholderImage:[UIImage imageNamed:@"net_error_icon.png"]];
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
    _tableview.tableHeaderView = headView;
}
#pragma scroview代理
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int index = scrollView.contentOffset.x/scrollView.frame.size.width;
    _PageC.currentPage = index;
}

#pragma tablview代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else{
        if (self.type_id == 1) {
            return 4;
        }else{
            return 3;
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 30;
    }else{
        if (self.type_id == 0) {
            if (indexPath.row == 1) {
                return 97;
            }
            else if (indexPath.row ==2) {
                return 160;
            }else
                return 30;
        }else{
            if (indexPath.row == 0) {
                return 30;
            }else if (indexPath.row == 1){
                return 91;
            }else if(indexPath.row == 2){
                return 97;
            }else
                return 160;
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section ==0) {
        return 0;
    }else
        return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            if (self.type_id == 0) {
                if(indexPath.row == 0){
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"name" forIndexPath:indexPath];
                    UILabel *label1 = (UILabel *)[cell viewWithTag:11];
                    UILabel *label2 = (UILabel *)[cell viewWithTag:12];
                    label1.text = self.detail.info_title;
                    label2.text = [NSString stringWithFormat:@"%d人浏览",self.detail.info_hits];
                    return cell;
                }else{
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"money" forIndexPath:indexPath];
                    UILabel *label1 = (UILabel *)[cell viewWithTag:21];
                    UILabel *label2 = (UILabel *)[cell viewWithTag:22];
                    label1.text = self.detail.info_home_price;
                    NSArray *arr = [self.detail.info_addtime componentsSeparatedByString:@" "];
                    label2.text = arr[0];
                    return cell;
                }
            }else{
                if(indexPath.row == 0){
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"name" forIndexPath:indexPath];
                    UILabel *label1 = (UILabel *)[cell viewWithTag:11];
                    UILabel *label2 = (UILabel *)[cell viewWithTag:12];
                    label1.text = self.detail.info_title;
                    label2.text = [NSString stringWithFormat:@"%d人浏览",self.detail.info_hits];
                    return cell;
                }else{
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"money" forIndexPath:indexPath];
                    UILabel *label1 = (UILabel *)[cell viewWithTag:21];
                    UILabel *label2 = (UILabel *)[cell viewWithTag:22];
                    label1.text = self.detail.info_job_salary;
                    NSArray *arr = [self.detail.info_addtime componentsSeparatedByString:@" "];
                    label2.text = arr[0];
                    return cell;
                }
            }
  
        }
            break;
            
        default:
        {
            if (self.type_id == 0) {
                if (indexPath.row == 0) {
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"adress" forIndexPath:indexPath];
                    UILabel *label = (UILabel *)[cell viewWithTag:88];
                    label.text = self.detail.info_home_address;
                    return cell;
                }else if (indexPath.row == 1){
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"star" forIndexPath:indexPath];
                    for (int i = 0; i<self.detail.info_home_config.count; i++) {
                        UIButton *btn = (UIButton *)[cell viewWithTag:i+100];
                        [btn setTitle:self.detail.info_home_config[i] forState:UIControlStateNormal];
                        btn.hidden = NO;
                    }
                    return cell;
                }else{
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"introduce" forIndexPath:indexPath];
                    UILabel *label2 = (UILabel *)[cell viewWithTag:42];
                    label2.text = self.detail.info_home_explain;
                    return cell;
                }
            }else{
                if (indexPath.row == 0) {
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"adress" forIndexPath:indexPath];
                    UILabel *label = (UILabel *)[cell viewWithTag:88];
                    label.text = self.detail.info_title;
                    return cell;
                }else if (indexPath.row == 2){
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"star" forIndexPath:indexPath];
                    for (int i = 0; i<self.detail.info_job_weal.count; i++) {
                        
                        UIButton *btn = (UIButton *)[cell viewWithTag:i+100];
                        [btn setTitle:self.detail.info_job_weal[i] forState:UIControlStateNormal];
                        btn.hidden = NO;
                    }
                    return cell;
                }else if(indexPath.row ==1){
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"message" forIndexPath:indexPath];
                    UILabel *label = (UILabel *)[cell viewWithTag:80];
                    UILabel *label1 = (UILabel *)[cell viewWithTag:81];
                    UILabel *label2 = (UILabel *)[cell viewWithTag:82];
                    label.text = self.detail.info_job_companyname;
                    label1.text = self.detail.info_job_number;
                    label2.text = self.detail.info_job_requirement;
                    return cell;
                }else{
                    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"introduce" forIndexPath:indexPath];
                    UILabel *label = (UILabel *)[cell viewWithTag:41];
                    label.text = @"公司介绍";
                    UILabel *label2 = (UILabel *)[cell viewWithTag:42];
                    label2.text = self.detail.info_job_companyintro;
                    return cell;
                }
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}


@end
