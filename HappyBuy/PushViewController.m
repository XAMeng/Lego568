//
//  PushViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/12.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "PushViewController.h"
#import "small_infp_type.h"
#import "PushTypeViewController.h"
#import "OtherInfoViewController.h"

@interface PushViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)UICollectionView *CollecttionView;
@property (nonatomic,strong)UIView *collView;
@property (nonatomic,strong)NSMutableArray *imgArray;
@property (nonatomic,strong)small_infp_type *small;
@property (nonatomic,strong)NSArray *array;
@property (nonatomic,strong)PushTypeViewController *pushtyp;


@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imgArray = [NSMutableArray array];
    [self ViewaddCollectView];
    _array = self.tp.small_infp_type;
    _pushtyp = [self.storyboard instantiateViewControllerWithIdentifier:@"PUType"];
    _pushtyp.arr = _array;
    [self addChildViewController:_pushtyp];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addtype:) name:@"typename" object:nil];
    
}
-(void)addtype:(NSNotification *)notify{
    UITableViewCell *cell = [self.tableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    UIButton *btn = (UIButton *)[cell viewWithTag:11];
    [btn setTitle:[notify object]forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
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
    [self.CollecttionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"mycell"];
    self.CollecttionView.delegate = self;
    self.CollecttionView.dataSource = self;
    [_collView addSubview:self.CollecttionView];
    _tableview.tableFooterView =_collView;
}
#pragma collecttionView----代理
//设置有多少个Cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imgArray.count + 1;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  //  static NSString * CellIdentifier = @"mycell";
    UICollectionViewCell * cell = [collectionView  dequeueReusableCellWithReuseIdentifier:@"mycell" forIndexPath:indexPath];
    if(!cell){
         cell = [[UICollectionViewCell  alloc] init];
    }
    if (indexPath.row == self.imgArray.count ) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10, 10, 40, 40);
        [button setBackgroundImage:[UIImage imageNamed:@"addpic.png"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(aDDImg:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:button];
    }else{
        UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        imgview.image = self.imgArray[indexPath.row];
        [cell addSubview:imgview];
    }
    return cell;
}
//加载一个UIActionSheet
-(void)aDDImg:(UIButton *)button{
    UIActionSheet *action= nil;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])  {
        action = [[UIActionSheet alloc]initWithTitle:@"添加照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"选取图片" otherButtonTitles:@"拍照", nil ];
    }else{
        action = [[UIActionSheet alloc]initWithTitle:@"添加照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"选取图片" otherButtonTitles:nil, nil ];
    }
    [action showInView:self.view];
}
//actionSheet点击事件
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSInteger souceType = 0;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        if(buttonIndex == 0){
            souceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }else if(buttonIndex == 1){
            souceType = UIImagePickerControllerSourceTypeCamera;
        }else{
            return;
        }
    }else{
        if (buttonIndex == 0) {
            souceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }else{
            return;
        }
    }
    UIImagePickerController *pickerview = [[UIImagePickerController alloc]init];
    pickerview.sourceType = souceType;
    pickerview.delegate = self;
    [self presentViewController:pickerview animated:YES completion:^{
    }];
}
//完成图片选取的时候触发代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *image= info[UIImagePickerControllerOriginalImage];
    [self.imgArray addObject:image];
    [_CollecttionView reloadData];
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
//UICollectionCell的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
//设置每个Cell的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 5, 5, 5);
}

//设置cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100, 100);
}

//设置最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//cell的最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

#pragma tableview----代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.page == 0) {
        return 8;
    }else
        return 11;
}
//选中时触发
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
}


//选择分类
-(void)btnclick:(UIButton *)button{
    _pushtyp.view.frame = CGRectMake(0, 0, Width, Height);
    [self.view addSubview:_pushtyp.view];
}
//选择福利
-(void)fuli:(UIButton *)button{
    [self performSegueWithIdentifier:@"peizhi" sender:self];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.page == 0) {
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"type" forIndexPath:indexPath];
            UIButton *button = (UIButton *)[cell viewWithTag:11];
            [button addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }else if(indexPath.row == 2){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"price" forIndexPath:indexPath];
            UITextField *textfile =(UITextField *)[cell viewWithTag:13];
            textfile.placeholder = @"价格";
            return cell;
        }else if(indexPath.row == 4){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"type" forIndexPath:indexPath];
            UIButton *button = (UIButton *)[cell viewWithTag:11];
            [button setTitle:@"配置" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(fuli:) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
        else{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"other" forIndexPath:indexPath];
            UITextField *textfile =(UITextField *)[cell viewWithTag:13];
            if (indexPath.row == 1) {
                textfile.placeholder = @"标题";
            }else if (indexPath.row == 3)
                textfile.placeholder = @"地址";
            else if(indexPath.row == 5)
                textfile.placeholder = @"房屋说明";
            else if(indexPath.row == 6)
                textfile.placeholder =@"联系人";
            else if(indexPath.row == 7){
                textfile.placeholder =@"手机号";
            }
            return cell;
        }
    }else{
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"type" forIndexPath:indexPath];
            UIButton *button = (UIButton *)[cell viewWithTag:11];
            [button addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:@"酒店招聘" forState:UIControlStateNormal];
            return cell;
        }else if(indexPath.row == 4){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"price" forIndexPath:indexPath];
            UITextField *textfile =(UITextField *)[cell viewWithTag:13];
            textfile.placeholder = @"薪资";
            return cell;
        }else if(indexPath.row == 5){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"type" forIndexPath:indexPath];
            UIButton *button = (UIButton *)[cell viewWithTag:11];
            [button setTitle:@"福利" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(fuli:) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        }
        else{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"other" forIndexPath:indexPath];
            UITextField *textfile =(UITextField *)[cell viewWithTag:13];
            if (indexPath.row == 1) {
                textfile.placeholder = @"标题";
            }else if (indexPath.row == 3)
                textfile.placeholder = @"招聘人数";
            else if(indexPath.row == 2)
                textfile.placeholder = @"职位";
            else if(indexPath.row == 6)
                textfile.placeholder =@"公司名称";
            else if(indexPath.row == 7)
                textfile.placeholder =@"公司地址";
            else if(indexPath.row == 8)
                textfile.placeholder = @"公司简介";
            else if(indexPath.row == 9)
                textfile.placeholder = @"联系人";
            else if(indexPath.row == 10)
                textfile.placeholder = @"手机号";
            return cell;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    OtherInfoViewController *oview = segue.destinationViewController;
    oview.page = self.page;
}


@end
