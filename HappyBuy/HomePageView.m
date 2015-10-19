//
//  HomePageView.m
//  HappyBuy
//
//  Created by echo24 on 15/9/25.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "HomePageView.h"
#import "TopView.h"
#import "RecommdCollectionViewCell.h"
#import "StoreServer.h"
#import "Store.h"
#import "small_company_type.h"
#import "companyType.h"
#import "DetailViewController.h"
#import "TypeViewController.h"
@interface HomePageView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIButton *center;
@property (nonatomic,strong)TopView *topv;
@property (nonatomic,strong)UICollectionView *CollecttionView;
@property (weak, nonatomic) IBOutlet UITableView *tabview;
@property (nonatomic,assign)int i;
@property (nonatomic,assign)NSInteger nextsction;
@property (nonatomic,strong)UIView *collView;
@property (nonatomic,strong)NSArray *recomdArray;
@property (nonatomic,strong)NSArray *adarr;
@property (nonatomic,strong)NSArray *comImgArry;
@property (nonatomic,assign)int compID;
@property (nonatomic,strong)NSIndexPath *inpath;
@end

@implementation HomePageView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    StoreServer *sover = [[StoreServer alloc] init];
    self.i = 0;
    [self leftrightbutton];
    [self addTopView];
    //获得推荐店铺信息
    [sover getStoreimge:2 success:^(NSArray *storeArray) {
        _recomdArray = storeArray;
        [self ViewaddCollectView];
    }];
    //获取广告的方法
    [sover getScrollerAd:2 sucess:^(NSArray *adArray) {
        _adarr = adArray;
        [self setTableViewContent];
    }];
    //获取商店信息
    [sover getCompanyImage:2 sucess:^(NSArray *imgArray) {
        _comImgArry = imgArray;
        [_tabview reloadData];
    }];
    
}


//为TableView设置内容ScrollView
-(void)setTableViewContent{
    UIScrollView *scview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 200, Width, 100)];
    scview.pagingEnabled = YES;
    scview.showsHorizontalScrollIndicator = NO;
    scview.showsVerticalScrollIndicator = NO;
    scview.contentSize = CGSizeMake(_adarr.count*Width,100);
    scview.backgroundColor = [UIColor clearColor];
    [_collView addSubview:scview];
    for (int i = 0; i < _adarr.count; i ++) {
        Store *sto = _adarr[i];
        UIImageView *imagev = [[UIImageView alloc] initWithFrame:CGRectMake(i*Width, 0, Width, 100)];
        [imagev sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",ServerWeb,sto.company_ad]]];
        [scview addSubview:imagev];
    }
    
}
//添加左右按钮
-(void)leftrightbutton{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    [btn setTitle:@"淮滨县" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"downArrow.png"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 80, 30);
    btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 20)];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 35, 0, 0)];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = leftButton;
    [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
    
}
//增加上边UIview
-(void)addTopView{
    //获取当前UIWindow
//    UIWindow *wind = [[UIApplication sharedApplication] keyWindow];
    _topv = [[TopView alloc] initWithFrame:CGRectMake(0, -Height, Width, Height)];
    //把UIview添加到tab下边
//    [wind insertSubview:_topv belowSubview:self.tabBarController.view];
    [self.view addSubview:_topv];

}
//左按钮点击事件
-(void)btnclick:(UIButton *)sender{
    if (self.i == 0) {
        _topv.center = CGPointMake(Width/2, Height/2+32);
        self.i ++;
    }else{
        _topv.center = CGPointMake(Width/2, -Height/2);
        self.i --;
    }
    
}

//创建一个Collectionview
-(void)ViewaddCollectView{
    _collView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width-30, 300)];
    _collView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:_collView];
    //创建流对象
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    self.CollecttionView = [[UICollectionView alloc] initWithFrame:CGRectMake(15, 15, Width-30, 200) collectionViewLayout:flowlayout];//创建CollecttionView
    self.CollecttionView.backgroundColor = [UIColor whiteColor];
    [self.CollecttionView registerClass:[RecommdCollectionViewCell class] forCellWithReuseIdentifier:@"mycell"];
    self.CollecttionView.delegate = self;
    self.CollecttionView.dataSource = self;
    [_collView addSubview:self.CollecttionView];
    _tabview.tableHeaderView =_collView;
}



//TableView代理
#pragma TableView
//设置块数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _comImgArry.count;
}
//设置每行的块数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    companyType *comtype = _comImgArry[section];
    if (comtype.isClose) {
        return 0;
    }
    NSArray *smallArry = comtype.small_company_type;
    return smallArry.count;
}
//设置Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    companyType *comtype = _comImgArry[indexPath.section];
    NSArray *smallArry = comtype.small_company_type;
    small_company_type *small = smallArry[indexPath.row];
    NSArray *storeArr = small.company;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell viewWithTag:5];
    label.text = small.company_type_name;
    //每次加载就消除button（目的是为了消除重影）
    for (UIView *view in cell.contentView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {//只要是button全部清除
            [view removeFromSuperview];
        }
    }
    for (int i = 0; i < storeArr.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = indexPath.section*1000 + indexPath.row*10 + i;
        button.frame = CGRectMake(110+ i*90, 0, 90, 43);
        Store *sto = storeArr[i];
        [button setTitle:sto.company_shortname forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(butClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:button];//要加载到contentView上边+
    }
    _inpath = indexPath;
    
    //如果是用stboard拖的不能清除对象。因为只初始化一次
//    UIButton *btn1 = (UIButton *)[cell viewWithTag:6];
//    UIButton *btn2 = (UIButton *)[cell viewWithTag:7];
//    UIButton *btn3 = (UIButton *)[cell viewWithTag:8];
//    if (storeArr == nil || storeArr.count==0) {
//        [btn1 setTitle:@"" forState:UIControlStateNormal];
//        [btn2 setTitle:@"" forState:UIControlStateNormal];
//        [btn3 setTitle:@"" forState:UIControlStateNormal];
//    }else{
//        for (int i = 0; i < storeArr.count; i ++) {
//            Store *sto = storeArr[i];
//            UIButton *btn = (UIButton *)[cell viewWithTag:i+6];
//            [btn setTitle:sto.company_shortname forState:UIControlStateNormal];
//        }

//    }

    return cell;
}
//tableview按钮的点击事件
-(void)butClick:(UIButton *)button{
    int i = button.tag %10;//确定是第几个button
    int row = (button.tag/10)%100;//获取button所在的row
    int section = (int)(button.tag/1000) ;//获取button所在的section
    companyType *comtype = _comImgArry[section];
    NSArray *smallArry = comtype.small_company_type;
    small_company_type *small = smallArry[row];
    NSArray *storeArr = small.company;
    Store *sto = storeArr[i];
    _compID = sto.company_id;
    [self performSegueWithIdentifier:@"buttonToDetail" sender:self];
}
//设置头视图的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 43;
}
//设置每块的头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 43)];
    headView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //加载左Button
    companyType *comtype = _comImgArry[section];//创建对象
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(30, 0, Width-50, 43);
    
    [button setTitle:comtype.company_type_name forState:UIControlStateNormal];
    [button addTarget:self action:@selector(HeadButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.tag = 10+section;
    [headView addSubview:button];
    //加载ImgeView
    UIImageView *myview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    [myview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",ServerWeb,comtype.company_type_ico]]];
    [headView addSubview:myview];
    //加载右Button
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(Width - 30, 0, 30, 43);
    rightButton.tag = 100 + section;
    if (!comtype.isClose) {
        [rightButton setImage:[UIImage imageNamed:@"arrow_down.png"] forState:UIControlStateNormal];
    }else{
        [rightButton setImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    }
    [rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:rightButton];
    
    return headView;
}
//HeadButton的点击事件
-(void)HeadButton:(UIButton *)button{
    self.nextsction = button.tag - 10;
    [self performSegueWithIdentifier:@"ToType" sender:self];
}

//设置cell内容隐藏的点击事件
-(void)buttonClick:(UIButton *)sender{
    companyType *comtype = _comImgArry[sender.tag - 100];
    if (!comtype.isClose) {
        comtype.isClose = YES;
    }else{
        comtype.isClose = NO;
    }
    [_tabview reloadData];
}




#pragma collectionView delegate

//设置有多少个Cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return _recomdArray.count;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"mycell";
    RecommdCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    Store *sto = _recomdArray[indexPath.row];
    UILabel *labelH = (UILabel *)[cell viewWithTag:20];
    UIImageView *imgv = (UIImageView *)[cell viewWithTag:21];

    labelH.text = sto.company_name;
    NSString *imgName = sto.company_ico;
    if ([imgName isEqual:[NSNull null]] ||imgName.length == 0 || [imgName isEqualToString:@"<null>"] || imgName == nil ) {
        NSLog(@"名字是空值");
        imgv.image = [UIImage imageNamed:@"net_error_icon.png"];
    }else{
        [imgv sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerWeb,sto.company_ico]] placeholderImage:[UIImage imageNamed:@"net_error_icon.png"]];
    }
    return cell;
}
//UICollectionCell的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    [self performSegueWithIdentifier:@"ToDetail" sender:self];//触发连线器的方法
}
//设置每个Cell的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 5, 5, 5);
}
//设置cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((Width-50)/3, 25);
}
//设置最行小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//cell的最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
//连线器
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ToDetail"]) {
        DetailViewController *detail = segue.destinationViewController;
        NSIndexPath *indexPath = [[_CollecttionView indexPathsForSelectedItems] lastObject];
        Store *sto = _recomdArray[indexPath.row];
        detail.comid = sto.company_id;
    }else if([segue.identifier isEqualToString:@"buttonToDetail"]){
        DetailViewController *detail = segue.destinationViewController;
        detail.comid = _compID;
    }else{
        TypeViewController *typView = segue.destinationViewController;
        typView.inpath = _nextsction;
    }
    
}


@end
