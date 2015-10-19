//
//  argumentViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/5.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "argumentViewController.h"
#import "UserLogin.h"
#import "UserInfo.h"
@interface argumentViewController ()
@property (weak, nonatomic) IBOutlet UITextField *content;

@end

@implementation argumentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonClick:(id)sender {
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSData *data = [user objectForKey:@"OneUser"];
    UserLogin *ulogin = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    UserInfo *uinfo = [[UserInfo alloc] init];
    [uinfo SetValueForUserInfo:ulogin.UserInforDic];
    
    UserTool *usertool = [[UserTool alloc] init];
    [usertool SendComment:_content.text Uid:uinfo.user_id comid:self.comid success:^(NSString *result) {
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
