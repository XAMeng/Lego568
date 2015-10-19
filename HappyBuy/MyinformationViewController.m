//
//  MyinformationViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/16.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "MyinformationViewController.h"
#import "UserTool.h"
#import "Detail_Info.h"

@interface MyinformationViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)NSArray *Array;

@end

@implementation MyinformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UserTool *tool = [[UserTool alloc] init];
    [tool Information:self.uid sucess:^(NSArray *collect) {
        self.Array = collect;
        [_tableview reloadData];
    }];
    UIView *foot = [[UIView alloc] init];
    self.tableview.tableFooterView = foot;
}

#pragma tableview ---delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row > 2) {
        return 97;
    }
    return 43;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.Array.count + 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 2){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell4" forIndexPath:indexPath];
        Detail_Info *detail = self.Array[indexPath.row - 3];
        UIImageView *imgview = (UIImageView *)[cell viewWithTag:10];
        NSArray *arr = detail.info_imgs_new;
        [imgview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",ServerWeb,arr[0]]] placeholderImage:[UIImage imageNamed:@"net_error_icon.png"]];
        UILabel *label = (UILabel *)[cell viewWithTag:11];
        label.text = detail.info_title;
        UILabel *content = (UILabel *)[cell viewWithTag:12];
        content.text = detail.info_contact;
        UILabel *price = (UILabel *)[cell viewWithTag:13];
        price.text = [NSString stringWithFormat:@"%@",detail.info_job_salary];
        UILabel *time = (UILabel *)[cell viewWithTag:14];
        NSString *timestr = [[detail.info_addtime componentsSeparatedByString:@" "] lastObject];
        time.text = timestr;
        UIButton *button = (UIButton *)[cell viewWithTag:15];
        [button addTarget:self action:@selector(missmess:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
}
-(void)missmess:(UIButton *)button{
    
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
