//
//  PushTypeViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/16.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "PushTypeViewController.h"
#import "small_infp_type.h"

@interface PushTypeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;


@end

@implementation PushTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableview.tableFooterView = [[UIView alloc] init];
}



#pragma tableview ----代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    small_infp_type *tsmall = self.arr[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell viewWithTag:11];
    label.text = tsmall.info_type_name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    small_infp_type *tsmall = self.arr[indexPath.row];
    NSString *name = tsmall.info_type_name;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"typename" object:name];
    [self.view removeFromSuperview];
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
