//
//  BuyHomeViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/6.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "BuyHomeViewController.h"
#import "TopView.h"
#import "goodsTool.h"
#import "GoodsImg.h"
#import "add_goods.h"
#import "listgoods.h"
#import "goodsDetailViewController.h"
@interface BuyHomeViewController ()
@property (nonatomic,assign)int i;
@property (nonatomic,strong)TopView *topv;
@property (weak, nonatomic) IBOutlet UITableView *tabview;
@property (nonatomic,strong)NSArray *arry;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong)NSIndexPath *index;
@property (nonatomic,assign)int goodid;
@end

@implementation BuyHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.index = [NSIndexPath indexPathForRow:0 inSection:0];
    self.i = 0;
    [self leftrightbutton];
    [self addTopView];
    
    //给tablview中加载数据
    goodsTool *mytool = [[goodsTool alloc] init];
    [mytool getGoodsImg:2 success:^(NSArray *Array) {
        self.arry = Array;
        [_tabview reloadData];
        [_collectionView reloadData];
    }];
}



//navgation左侧按钮
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
//点击城市回弹出来一个蒙版
-(void)addTopView{
    _topv = [[TopView alloc] initWithFrame:CGRectMake(0, -Height, Width, Height)];
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


#pragma UICollectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    GoodsImg *imggood = self.arry[self.index.row];
    NSArray *listArray = imggood.listgoods;
    return listArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mycell" forIndexPath:indexPath];
    GoodsImg *imggood = self.arry[self.index.row];
    NSArray *listArray = imggood.listgoods;
    listgoods *listgood = [[listgoods alloc] init];
    [listgood SetValueForListGoods:listArray[indexPath.row]];
    
    UILabel *label = (UILabel *)[cell viewWithTag:12];
    label.text = listgood.goods_name;
    UIImageView *imgView = (UIImageView *)[cell viewWithTag:13];
    imgView.layer.masksToBounds = YES;
    imgView.layer.cornerRadius = 8.0;
    NSLog(@"%@",listgood.goods_url);
    [imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerWeb,listgood.goods_imgs]] placeholderImage:[UIImage imageNamed:@"net_error_icon.png"]];
    return cell;

}
//设置每个Cell的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
//设置cell的大小
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake((Width-50)/3, 25);
//}
//设置最行小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//cell的最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}
//UICollectionCell的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GoodsImg *imggood = self.arry[self.index.row];
    NSArray *listArray = imggood.listgoods;
    listgoods *listgood = [[listgoods alloc] init];
    [listgood SetValueForListGoods:listArray[indexPath.row]];
    self.goodid = listgood.goods_id;
    [self performSegueWithIdentifier:@"Detail" sender:self];
}

//返回collectionView的HeadView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    GoodsImg *imggood = self.arry[self.index.row];////////////////
    //用一个数组来装广告的数量adArray
    NSArray *adArray = imggood.add_goods;
    UICollectionReusableView *collectionRV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:@"head" forIndexPath:indexPath];
    UIScrollView *scview = (UIScrollView *)[collectionRV viewWithTag:10];
    scview.pagingEnabled = YES;
    scview.showsHorizontalScrollIndicator = NO;
    scview.showsVerticalScrollIndicator = NO;
    scview.backgroundColor = [UIColor redColor];
    scview.contentSize = CGSizeMake(scview.bounds.size.width * adArray.count, scview.bounds.size.height);
    for (int i = 0; i < adArray.count; i++) {
        UIImageView *imagev = [[UIImageView alloc] initWithFrame:CGRectMake(i*scview.bounds.size.width, 0, scview.bounds.size.width, scview.bounds.size.height)];
        add_goods *ad_good = [[add_goods alloc] init];
        [ad_good SetValueForadd_goods:adArray[i]];
        NSLog(@"%@",ad_good.goods_ad);
        [imagev sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerWeb,ad_good.goods_ad]] placeholderImage:[UIImage imageNamed:@"net_error_icon.png"]];
        [scview addSubview:imagev];
    }

    return collectionRV;
    
}
//设置head的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    GoodsImg *imggood = self.arry[self.index.row];////////////////
    //用一个数组来装广告的数量adArray
    NSArray *adArray = imggood.add_goods;
    if (adArray.count == 0) {
        return CGSizeMake(0, 0);
    }else
        return CGSizeMake(282, 69);
}



#pragma UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell viewWithTag:20];
    GoodsImg *myimg = self.arry[indexPath.row];
    label.text = myimg.goods_type_name;
    cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIView *leftView = (UIView *)[cell viewWithTag:19];
    if (self.index == indexPath) {
        leftView.hidden = NO;
        label.textColor = [UIColor redColor];
    }else{
        leftView.hidden = YES;
        label.textColor = [UIColor blackColor];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.index = indexPath;
    [_tabview reloadData];
    [_collectionView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation  ---连线器

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    goodsDetailViewController *detailview = segue.destinationViewController;
    detailview.goodid = self.goodid;
}


@end
