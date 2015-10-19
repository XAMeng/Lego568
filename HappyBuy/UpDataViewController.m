//
//  UpDataViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/13.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "UpDataViewController.h"
#import "UserLogin.h"

@interface UpDataViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property (nonatomic,strong)UserLogin *ulogin;
@property (weak, nonatomic) IBOutlet UIButton *confirm;

@end

@implementation UpDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view..
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSData *data = [user objectForKey:@"OneUser"];
    _ulogin = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"会员ID == %d",self.info.user_id);
    [self FillTextFile];
}

-(void)FillTextFile{
    if (self.indexpx.row == 0) {
        if (![self.info.user_name isKindOfClass:[NSNull class]]) {
            self.textfield.text = self.info.user_name;
        }else{
            self.textfield.placeholder = @"请输入用户名";
        }
    }else if(self.indexpx.row == 2){
        if (![self.info.user_birthday isKindOfClass:[NSNull class]]) {
            self.textfield.text = self.info.user_birthday;
        }else{
            self.textfield.placeholder = @"请输入生日";
        }
    }else if(self.indexpx.row == 3){
        if (![self.info.user_phone isKindOfClass:[NSNull class]]) {
            self.textfield.text = self.info.user_phone;
        }else{
            self.textfield.placeholder = @"请输入手机号";
        }
    }else if(self.indexpx.row == 4){
        if (![self.info.user_qq isKindOfClass:[NSNull class]]) {
            self.textfield.text = self.info.user_qq;
        }else{
            self.textfield.placeholder = @"请输入QQ号";
        }
    }else if(self.indexpx.row == 5){

        if (![self.info.user_mail isKindOfClass:[NSNull class]]) {
            self.textfield.text = self.info.user_mail;
        }else{
            self.textfield.placeholder = @"请输入邮箱";
        }
    }else if (self.indexpx.row == 6){
        if (![self.info.user_address isKindOfClass:[NSNull class]]) {
            self.textfield.text = self.info.user_address;
        }else{
            self.textfield.placeholder = @"请输入住址";
        }
    }else if(self.indexpx.row == 7){
        if (![self.info.user_phone2 isKindOfClass:[NSNull class]]) {
            self.textfield.text = self.info.user_phone2;
        }else{
            self.textfield.placeholder = @"请输入备用号码";
        }
    }else {
        if (![self.info.user_address2 isKindOfClass:[NSNull class]]) {
            self.textfield.text = self.info.user_address2;
        }else{
            self.textfield.placeholder = @"请输入备用地址";
        }
    }
}
//点击事件，修改
- (IBAction)confirm:(UIButton *)sender {
    //修改之后需要重新归档
    if (self.indexpx.row == 0) {
        self.info.user_name = _textfield.text;
    }else if(self.indexpx.row == 2){
        self.info.user_birthday = _textfield.text;
    }else if(self.indexpx.row == 3){
        self.info.user_phone = _textfield.text;
    }else if(self.indexpx.row == 4){
        self.info.user_qq = _textfield.text;
    }else if(self.indexpx.row == 5){
        self.info.user_mail = _textfield.text;
    }else if (self.indexpx.row == 6){
        self.info.user_address = _textfield.text;
    }else if(self.indexpx.row == 7){
        self.info.user_phone2 = _textfield.text;
    }else {
        self.info.user_address2 = _textfield.text;
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sendMyInfo" object:self.info userInfo:nil];
    [self.navigationController popViewControllerAnimated:YES];
    
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
