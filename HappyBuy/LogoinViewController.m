//
//  LogoinViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/5.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "LogoinViewController.h"
#import "UserLogin.h"
#import "UserInfo.h"

@interface LogoinViewController ()
@property (weak, nonatomic) IBOutlet UITextField *text1;
@property (weak, nonatomic) IBOutlet UITextField *text2;
@property (nonatomic,strong) UserLogin *ulogin;
@end

@implementation LogoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}

-(void)SetTextAttributre{
    

}

- (IBAction)LoginButton:(id)sender {
    StoreServer *stover = [[StoreServer alloc] init];
    [stover LoginServer:self.text1.text pass:self.text2.text success:^(UserLogin *content) {
        NSString *retcon = content.content;
        NSLog(@"登陆状态 == %@",retcon);
        //归档操作
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:content];
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:data forKey:@"OneUser"];
        [self.navigationController popViewControllerAnimated:YES];
//        NSUserDefaults *user1 = [NSUserDefaults standardUserDefaults];
//        NSData *data1 = [user1 objectForKey:@"OneUser"];
//        UserLogin *ulogin = [NSKeyedUnarchiver unarchiveObjectWithData:data1];
//        
//        UserInfo *uinfo = [[UserInfo alloc] init];
//        [uinfo SetValueForUserInfo:ulogin.UserInforDic];
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
