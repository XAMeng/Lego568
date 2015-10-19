//
//  DetailViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/9/28.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "DetailViewController.h"
#import "StoreServer.h"
#import "Store.h"
#import "companyPro.h"
#import "LogoinViewController.h"
#import "argumentViewController.h"
#import "UserLogin.h"
#import "AllCommentViewController.h"
#import "ReportViewController.h"
@interface DetailViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)Store *sto;
@property (weak, nonatomic) IBOutlet UITableView *Detailtabview;
@property (nonatomic,strong)UIPageControl *PageC;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    StoreServer *stoser = [[StoreServer alloc] init];
    [stoser getStoreDetail:2 companyID:self.comid sucess:^(Store *store) {
        self.sto = store;
        [self SettableViewHead];
        [_Detailtabview reloadData];
        self.navigationItem.title = store.company_name;
    }];
}


//为tablview里边添加头
-(void)SettableViewHead{
    //获取数据
    NSArray *imgArr = self.sto.company_imgs_new;
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 170)];
    //加载UIScrollView
    UIScrollView *ScroView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Width, 170)];
    [ScroView setContentSize:CGSizeMake(Width *imgArr.count, 170)];
    ScroView.pagingEnabled = YES;
    ScroView.showsHorizontalScrollIndicator = NO;
    ScroView.showsVerticalScrollIndicator = NO;
    ScroView.delegate = self;
    for (int i = 0; i < imgArr.count; i ++) {
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(Width*i, 0, Width, 170)];
        [imgV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",ServerWeb,imgArr[i]]] placeholderImage:[UIImage imageNamed:@"net_error_icon.png"]];
        [ScroView addSubview:imgV];
    }
    [headView addSubview:ScroView];
    //设置一个蒙版
    UIView *downView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, Width, 20)];
    downView.backgroundColor = [UIColor whiteColor];
    downView.alpha = 0.4;
    [headView addSubview:downView];
    //加载一个UIPageControl
    _PageC = [[UIPageControl alloc] initWithFrame:CGRectMake(130, 150, Width, 20)];
    _PageC.numberOfPages = imgArr.count;
    _PageC.pageIndicatorTintColor = [UIColor orangeColor];
    _PageC.currentPageIndicatorTintColor = [UIColor whiteColor];
    _PageC.tag = 50;
    [headView addSubview:_PageC];
    

    _Detailtabview.tableHeaderView = headView;
}
#pragma scroview代理
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int index = scrollView.contentOffset.x/scrollView.frame.size.width;
    _PageC.currentPage = index;
}

#pragma tableview代理
//每块有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = self.sto.company_pro;
    return array.count+7;
}
//加载Cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoreMess" forIndexPath:indexPath];
        UILabel *label = (UILabel *)[cell viewWithTag:51];
        label.text = [NSString stringWithFormat:@"%ld人浏览",(long)self.sto.company_hits];
        return cell;
    }
    else if (indexPath.row == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoreIntroduce" forIndexPath:indexPath];
        UILabel *lab = (UILabel *)[cell viewWithTag:52];
        lab.text = [NSString stringWithFormat:@"%@",self.sto.company_name];
        UILabel *label = (UILabel *)[cell viewWithTag:53];
        label.text = [NSString stringWithFormat:@"%@",self.sto.company_address];
        return cell;
    }
    else if (indexPath.row == 2) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Phone" forIndexPath:indexPath];
        UILabel *label = (UILabel *)[cell viewWithTag:54];
        label.text = [NSString stringWithFormat:@"%@:%@",self.sto.company_contact,self.sto.company_tel];
        return  cell;
    }
    else if (indexPath.row == 3) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"stilCell" forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.row == 4) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Introduce" forIndexPath:indexPath];
        UILabel *label = (UILabel *)[cell viewWithTag:55];
        label.text = self.sto.company_about;
        return cell;
    }
    else if (indexPath.row == 5) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoCell" forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.row == 6) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Company_pro" forIndexPath:indexPath];
        return cell;
    }else {
        NSArray *array = self.sto.company_pro;
        companyPro *compro = array[indexPath.row-7];
        NSString *url = compro.company_pro_imgsrc;
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Pro_Photo" forIndexPath:indexPath];
        UIImageView *imgview = (UIImageView *)[cell viewWithTag:56];
        [imgview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",ServerWeb,url]]];
        
        UILabel *label1 = (UILabel *)[cell viewWithTag:57];
        label1.text = compro.company_pro_title;
        UILabel *label2 = (UILabel *)[cell viewWithTag:58];
        label2.text = compro.company_pro_content;
        UILabel *label3 = (UILabel *)[cell viewWithTag:59];
        label3.text = compro.company_pro_remarks;
        return cell;
    }

}
//设置每行的高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 5 || indexPath.row == 6) {
        return 45;
    }
    else if (indexPath.row == 1|| indexPath.row == 4) {
        return 75;
    }
    return 90;
    
    
}
//添加评论
- (IBAction)suggest:(UIBarButtonItem *)sender {
    //解档
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSData *data = [user objectForKey:@"OneUser"];
    UserLogin *ulogin = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if (ulogin.status == 0 ) {
        [self performSegueWithIdentifier:@"login" sender:self];
    }else
        [self performSegueWithIdentifier:@"suggest" sender:self];
}
//查看所有评论
- (IBAction)Allcomment:(id)sender {
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation
//连线器
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"login"]) {
        LogoinViewController *loview = segue.destinationViewController;
    }
    else if([segue.identifier isEqualToString:@"suggest"])
    {
        argumentViewController *argumentView = segue.destinationViewController;
        argumentView.comid = self.comid;
    }
    else if([segue.identifier isEqualToString:@"comment"])
    {
        AllCommentViewController *allcomment = segue.destinationViewController;
        allcomment.stoid = self.comid;
    }else if([segue.identifier isEqualToString:@"report"])
    {
        ReportViewController *reportView = segue.destinationViewController;
        reportView.comid = self.comid;
    }
}

@end
