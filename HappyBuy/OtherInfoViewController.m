//
//  OtherInfoViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/16.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "OtherInfoViewController.h"
#import "message.h"

@interface OtherInfoViewController ()
@property (nonatomic,strong)NSArray *Array;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation OtherInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    message *mess = [[message alloc] init];
    _tableview.tableFooterView = [[UIView alloc] init];
    [mess getpezhi:self.page+1 info_id:9 sucess:^(NSArray *arr) {
        self.Array = arr;
        [_tableview reloadData];
    }];
}

#pragma  tableview
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.Array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell viewWithTag:11];
    label.text = self.Array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIButton *btn = (UIButton *)[cell viewWithTag:12];
    if (btn.selected == YES) {
        btn.selected = NO;
    }else{
        btn.selected = YES;
    }
}
- (IBAction)confimbutton:(id)sender {
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
