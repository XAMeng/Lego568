//
//  TypeViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/9/29.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "TypeViewController.h"
#import "StoreServer.h"
#import "companyType.h"
#import "small_company_type.h"
#import "Store.h"
#import "DetailViewController.h"
@interface TypeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *Typetabview;
@property (nonatomic,strong)NSArray *array;
@property (nonatomic,assign)int comID;
@end

@implementation TypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    StoreServer *stoserver = [[StoreServer alloc] init];
    [stoserver getCompanyImage:2 sucess:^(NSArray *imgArray) {
        self.array = imgArray;
        [_Typetabview reloadData];
    }];
}



#pragma TableView delegate
//一共有多少块
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    companyType *comtype = self.array[self.inpath];
    NSArray *smallArry = comtype.small_company_type;
    return smallArry.count;
}
//每块有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    companyType *comtype = self.array[self.inpath];
    NSArray *smallArry = comtype.small_company_type;
    small_company_type *small = smallArry[section];
    NSArray *stoArray = small.company;
    if (stoArray.count == 0 ) {
        return 1;
    }else
        return 2;
}

//Cell的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    companyType *comtpye = self.array[self.inpath];
    NSArray *smallArry = comtpye.small_company_type;
    small_company_type *small = smallArry[indexPath.section];
   
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        UILabel *label = (UILabel *)[cell viewWithTag:20];
        label.text = small.company_type_name;
        return cell;
    }else{
        NSArray *array = small.company;
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];

            for (int i = 0; i < array.count; i ++) {
                Store *sto = array[i];
                UIButton *btn = (UIButton *)[cell viewWithTag:i+21];
                [btn setTitle:sto.company_shortname forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(btnclick:) forControlEvents:UIControlEventTouchUpInside];
            }
        return cell;
        }
    
}
//button的点击事件
-(void)btnclick:(UIButton *)button{

    companyType *comtype = self.array[self.inpath];
    NSArray *smallArry = comtype.small_company_type;
    small_company_type *small = smallArry[[self.Typetabview indexPathForCell:((UITableViewCell *)[[button  superview]superview])].section];
    NSArray *stoArray = small.company;
    NSLog(@"%ld",(long)button.tag);
    Store *sto = stoArray[button.tag-21];
    self.comID = sto.company_id;
    [self performSegueWithIdentifier:@"toDetail" sender:self];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//连线器
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *deview = segue.destinationViewController;
    deview.comid = self.comID;
}


@end
