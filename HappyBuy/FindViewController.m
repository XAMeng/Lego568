//
//  FindViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/9.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "FindViewController.h"
#import "companyType.h"
#import "TopView.h"
#import "message.h"
#import "type.h"
#import "small_infp_type.h"
#import "listinfo.h"
#import "MessDetailViewController.h"
#import "PushViewController.h"
#import "TypeView.h"

@interface FindViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collect;
@property (nonatomic,strong)TopView *topv;
@property (nonatomic,assign)int i;
@property (nonatomic,strong)NSArray *arr;
@property (nonatomic,assign)int type_id;
@property (nonatomic,assign)BOOL isOpen;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (nonatomic,strong)NSArray *NameArray;
@property (nonatomic,assign)int info_id;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self leftrightbutton];
    [self addTopView];
    self.i = 0;
    self.type_id = 0;
    _isOpen =YES;
    message *mess = [[message alloc] init];
    [mess getGoodsImg:2 success:^(NSArray *Array) {
        self.arr = Array;
        [_collect reloadData];
    }];
}
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

- (IBAction)PushButton:(id)sender {
    
}

#pragma collecttionView ---- 代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    type *typ = self.arr[self.type_id];
    if (typ.selectnum > 0 && typ.selectnum %2 == 0) {
        return 3;
    }else
        return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    type *typ = self.arr[self.type_id];
    if (typ.selectnum > 0 && typ.selectnum %2 == 0){
        if (section == 0) {
            return 2;
        }else if(section == 1){
            return typ.small_infp_type.count;

        }else{
            type *typ =self.arr[self.type_id];
            return typ.listinfo.count;
        }
    }else{
        if (section == 0) {
            return 2;
        }else{
            type *typ =self.arr[self.type_id];
            return typ.listinfo.count;
        }
    }

}
//collect的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    type *typ = self.arr[self.type_id];
    if (typ.selectnum > 0 && typ.selectnum %2 == 0){
        if (indexPath.section == 2) {
            NSArray *listArray = typ.listinfo;
            listinfo *info = listArray[indexPath.row];
            self.info_id = info.info_id;
            [self performSegueWithIdentifier:@"imgdetail" sender:self];
        }
        else if (indexPath.section == 1) {
            self.NameArray = typ.small_infp_type;
            [self performSegueWithIdentifier:@"imgdetail" sender:self];
        }
    }else{
        if (indexPath.section == 1) {
            NSArray *listArray = typ.listinfo;
            listinfo *info = listArray[indexPath.row];
            self.info_id = info.info_id;
            [self performSegueWithIdentifier:@"imgdetail" sender:self];
        }
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    type *typ = self.arr[self.type_id];
    if (typ.selectnum > 0 && typ.selectnum %2 == 0) {
        switch (indexPath.section) {
            case 0:
            {
                if (indexPath.row == 0) {
                    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
                    UIButton *btn = (UIButton *)[cell viewWithTag:50];
                    [btn addTarget:self action:@selector(typnumber:) forControlEvents:UIControlEventTouchUpInside];
                    return cell;
                }else{
                    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];
                    UIButton *btn = (UIButton *)[cell viewWithTag:51];
                    [btn addTarget:self action:@selector(typnumber:) forControlEvents:UIControlEventTouchUpInside];
                    return cell;
                }
            }
            break;
            case 1:
                {
                    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell3" forIndexPath:indexPath];
                    UILabel *label = (UILabel *)[cell viewWithTag:11];
                    type *typ = self.arr[self.type_id];
                    NSArray *smallArray = typ.small_infp_type;
                    small_infp_type *small = smallArray[indexPath.row];
                    label.text = small.info_type_name;
                    return cell;
                }
                break;
            default:
            {
                UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell4" forIndexPath:indexPath];
                type *typ = self.arr[self.type_id];
                NSArray *listArray = typ.listinfo;
                listinfo *info = listArray[indexPath.row];
                UIImageView *imgview = (UIImageView *)[cell viewWithTag:20];
                [imgview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerWeb,info.info_imgs]] placeholderImage:[UIImage imageNamed:@"net_error_icon.png"]];
                UILabel *title = (UILabel *)[cell viewWithTag:21];
                title.text = info.info_title;
                UILabel *address = (UILabel *)[cell viewWithTag:22];
                address.text = info.info_address;
                UILabel *price = (UILabel *)[cell viewWithTag:23];
                price.text = [NSString stringWithFormat:@"¥ %@",info.info_money];
                //把字符串转换为数组
                NSArray *arr = [info.info_addtime componentsSeparatedByString:@" "];
                UILabel *time = (UILabel *)[cell viewWithTag:24];
                time.text = arr[0];
                return cell;
            }
                break;
        }

    }else{
        switch (indexPath.section) {
            case 0:
            {
                if (indexPath.row == 0) {
                    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
                    UIButton *btn = (UIButton *)[cell viewWithTag:50];
                    [btn addTarget:self action:@selector(typnumber:) forControlEvents:UIControlEventTouchUpInside];
                    return cell;
                }else{
                    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];
                    UIButton *btn = (UIButton *)[cell viewWithTag:51];
                    [btn addTarget:self action:@selector(typnumber:) forControlEvents:UIControlEventTouchUpInside];
                    return cell;
                }
            }
                break;
            default:
            {
                UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell4" forIndexPath:indexPath];
                type *typ = self.arr[self.type_id];
                NSArray *listArray = typ.listinfo;
                listinfo *info = listArray[indexPath.row];
                UIImageView *imgview = (UIImageView *)[cell viewWithTag:20];
                [imgview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServerWeb,info.info_imgs]] placeholderImage:[UIImage imageNamed:@"net_error_icon.png"]];
                UILabel *title = (UILabel *)[cell viewWithTag:21];
                title.text = info.info_title;
                UILabel *address = (UILabel *)[cell viewWithTag:22];
                address.text = info.info_address;
                UILabel *price = (UILabel *)[cell viewWithTag:23];
                price.text = [NSString stringWithFormat:@"¥ %@",info.info_money];
                //把字符串转换为数组
                NSArray *arr = [info.info_addtime componentsSeparatedByString:@" "];
                UILabel *time = (UILabel *)[cell viewWithTag:24];
                time.text = arr[0];
                return cell;
            }
                break;
        }
    }
}

//button点击事件
-(void)typnumber:(UIButton *)button{
    self.type_id = (int)(button.tag-50);
    if (button.tag == 50) {
        type *typ1 = self.arr[1];
        typ1.selectnum = 0;
        type *typ = self.arr[0];
        typ.selectnum ++;
        UICollectionViewCell *cell=[_collect cellForItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        UIButton *btn = (UIButton *)[cell viewWithTag:51];
        btn.selected = NO;
        [_button setTitle:@"免费发布房产信息" forState:UIControlStateNormal];
        if (typ.selectnum%2==0 && typ.selectnum > 0) {
            button.selected = YES;
        }else{
            button.selected = NO;
        }
        
        
    }
    else if (button.tag == 51) {
        type *typ1 = self.arr[0];
        typ1.selectnum = 0;
        type *typ = self.arr[1];
        typ.selectnum ++;
        UICollectionViewCell *cell=[_collect cellForItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        UIButton *btn = (UIButton *)[cell viewWithTag:50];
        btn.selected = NO;
        [_button setTitle:@"免费发布招聘信息" forState:UIControlStateNormal];
        if (typ.selectnum %2 == 0 && typ.selectnum >0) {
            button.selected = YES;
        }else{
            button.selected = NO;
        }
    }
    [_collect reloadData];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation
//连线器
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"imgdetail"]) {
        MessDetailViewController *messdetail = segue.destinationViewController;
        messdetail.info_id = self.info_id;
        messdetail.type_id = self.type_id;
    }else if([segue.identifier isEqualToString:@"sendinformation"]) {
        PushViewController *push = segue.destinationViewController;
        push.page = self.type_id;
        push.tp = self.arr[self.type_id];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    type *typ = self.arr[self.type_id];
    if (typ.selectnum > 0 && typ.selectnum %2 == 0){
        if(indexPath.section==0){
            return CGSizeMake(187, 80);
        }else if(indexPath.section==1){
            return  CGSizeMake(93, 30);
        }else{
            return CGSizeMake(375, 100);
        }
    }else{
        if (indexPath.section == 0) {
            return CGSizeMake(187, 80);
        }else{
            return CGSizeMake(375, 100);
        }
    }
}
@end
