//
//  ReportViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/5.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "ReportViewController.h"
#import "UserInfo.h"
@interface ReportViewController ()
@property (weak, nonatomic) IBOutlet UILabel *text1;
@property (weak, nonatomic) IBOutlet UILabel *text2;
@property (weak, nonatomic) IBOutlet UILabel *text3;
@property (weak, nonatomic) IBOutlet UILabel *text4;
@property (nonatomic,strong)NSString *tip;
@end

@implementation ReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)reportcontent:(UIButton *)sender {
        NSArray *arr = @[@"卖假货",@"卖过期货",@"服务态度不好",@"宰客"];
    for (int i = 11; i <= 14; i ++) {
        if (sender.tag == i) {
            sender.selected = YES;
            
        }else{
            UIButton *btn = (UIButton *)[self.view viewWithTag:i];
            btn.selected = NO;
        }
    }
    self.tip = arr[sender.tag-11];
}


- (IBAction)ReportButton:(id)sender {
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSData *data = [user objectForKey:@"OneUser"];
    UserLogin *ulogin = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    UserInfo *uinfo = [[UserInfo alloc] init];
    [uinfo SetValueForUserInfo:ulogin.UserInforDic];
    UserTool *tool = [[UserTool alloc] init];
   
    [tool ReportCompany:self.tip Uid:uinfo.user_id comid:self.comid success:^(NSString *result) {
        NSLog(@"%@",result);
    }];
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
