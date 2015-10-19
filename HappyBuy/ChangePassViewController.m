//
//  ChangePassViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/14.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "ChangePassViewController.h"
#import "UserTool.h"
#import "UserInfo.h"

@interface ChangePassViewController ()
@property (weak, nonatomic) IBOutlet UITextField *oldpass;
@property (weak, nonatomic) IBOutlet UITextField *newpass1;
@property (weak, nonatomic) IBOutlet UITextField *newpass2;

@end

@implementation ChangePassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//确认修改密码
- (IBAction)confirmbutton:(id)sender {
    
    UserTool *utool = [[UserTool alloc] init];
    [utool Userid:_uerid oldpass:_oldpass.text newpass:_newpass1.text newpass1:_newpass2.text success:^(UserLogin *content) {
        if (content.status) {
            NSLog(@"修改成功");
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user removeObjectForKey:@"OneUser"];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else{
            NSLog(@"%@",content.content);
        }
    }];
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
