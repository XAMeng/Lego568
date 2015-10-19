//
//  SetIMAGEViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/13.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "SetIMAGEViewController.h"
#import "UpDataViewController.h"
#import "UserLogin.h"
#import "UserTool.h"
#import "StoreServer.h"
#import "ChangePassViewController.h"
#import "SEXViewController.h"
#import "DateViewController.h"

@interface SetIMAGEViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong)NSIndexPath *index;
@property (nonatomic,strong)UserLogin *login;
@property (nonatomic,strong)SEXViewController *sexview;
@property (nonatomic,strong)DateViewController *dateview;
@property (nonatomic,strong)NSString *sex;
@end

@implementation SetIMAGEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self AddHeadView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SendInfo:) name:@"sendMyInfo" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setSExin:) name:@"setsex" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(birthday:) name:@"birthday" object:nil];
    _sexview = [self.storyboard instantiateViewControllerWithIdentifier:@"sexview"];
    _dateview = [self.storyboard instantiateViewControllerWithIdentifier:@"dateid"];
    _dateview.info = self.uinfo;
    [self addChildViewController:_sexview];
    [self addChildViewController:_dateview];
    
}

-(void)birthday:(NSNotification *)birthday{
    UITableViewCell *cell = [_tableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    UILabel *label2 = (UILabel *)[cell viewWithTag:12];
    label2.text = [birthday object];
}
-(void)SendInfo:(NSNotification *)notify{
    UserInfo *info = [notify object];
    self.uinfo = info;
    [_tableview reloadData];
}
-(void)setSExin:(NSNotification *)notify{
    self.sex = [notify object];
    UITableViewCell *cell = [_tableview cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    UILabel *label2 = (UILabel *)[cell viewWithTag:12];
    label2.text = self.sex;
}
-(void)AddHeadView{
    UIView *headview =[[UIView alloc] initWithFrame:CGRectMake(0, 0, Width, 20)];
    headview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 200, 20)];
    label.text = [NSString stringWithFormat:@"你好:%@",_uinfo.user_name];
    [headview addSubview:label];
    _tableview.tableHeaderView = headview;
}

#pragma tableview ------代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 2;
    }else
        return 9;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            if (indexPath.row == 0) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
                UILabel *label2 = (UILabel *)[cell viewWithTag:12];
                label2.text = self.uinfo.user_name;
                return cell;
            }else if (indexPath.row == 1){
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
                UILabel *label1 = (UILabel *)[cell viewWithTag:11];
                label1.text = @"性别";
                UILabel *label2 = (UILabel *)[cell viewWithTag:12];
                label2.text = self.uinfo.user_sex;
                return cell;
            }else if (indexPath.row == 2){
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
                UILabel *label1 = (UILabel *)[cell viewWithTag:11];
                label1.text = @"生日";
                UILabel *label2 = (UILabel *)[cell viewWithTag:12];
                if (![self.uinfo.user_birthday isKindOfClass:[NSNull class]]) {
                    label2.text = self.uinfo.user_birthday;
                }else
                    label2.text = @"请输入生日";
                
                return cell;
            }else if(indexPath.row == 3){
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
                UILabel *label1 = (UILabel *)[cell viewWithTag:11];
                label1.text = @"手机号";
                UILabel *label2 = (UILabel *)[cell viewWithTag:12];
                if (![self.uinfo.user_phone isKindOfClass:[NSNull class]]) {
                    label2.text = self.uinfo.user_phone;
                }else
                    label2.text = @"请输入手机号";
                return cell;
            }else if(indexPath.row == 4){
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
                UILabel *label1 = (UILabel *)[cell viewWithTag:11];
                label1.text = @"QQ";
                UILabel *label2 = (UILabel *)[cell viewWithTag:12];
                if (![self.uinfo.user_qq isKindOfClass:[NSNull class]]) {
                    label2.text = self.uinfo.user_qq;
                }else
                    label2.text = @"请输入QQ";
                return cell;
            }else if(indexPath.row == 6){
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
                UILabel *label1 = (UILabel *)[cell viewWithTag:11];
                label1.text = @"地址";
                UILabel *label2 = (UILabel *)[cell viewWithTag:12];
                if (![self.uinfo.user_address isKindOfClass:[NSNull class]]) {
                    label2.text = self.uinfo.user_address;
                }else
                    label2.text = @"请输入地址";
                return cell;
            }else if(indexPath.row == 7){
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
                UILabel *label1 = (UILabel *)[cell viewWithTag:11];
                label1.text = @"备用号码";
                UILabel *label2 = (UILabel *)[cell viewWithTag:12];
                if (![self.uinfo.user_phone2 isKindOfClass:[NSNull class]]) {
                    label2.text = self.uinfo.user_phone2;
                }else
                    label2.text = @"请输入备用号码";
                return cell;
            }else if(indexPath.row == 8){
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
                UILabel *label1 = (UILabel *)[cell viewWithTag:11];
                label1.text = @"备用地址";
                UILabel *label2 = (UILabel *)[cell viewWithTag:12];
                if (![self.uinfo.user_address2 isKindOfClass:[NSNull class]]) {
                    label2.text = self.uinfo.user_address2;
                }else
                    label2.text = @"请输入备用地址";
                return cell;
            }else {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
                UILabel *label1 = (UILabel *)[cell viewWithTag:11];
                label1.text = @"邮箱";
                UILabel *label2 = (UILabel *)[cell viewWithTag:12];
                if (![self.uinfo.user_mail isKindOfClass:[NSNull class]]) {
                    label2.text = self.uinfo.user_mail
                    ;
                }else
                    label2.text = @"请输入邮箱";
                return cell;
            }

        }
            break;
            
        default:{
            if (indexPath.row == 0) {
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
                return cell;
            }else{
                UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
                return cell;
            }

        }
            break;
    }
}
//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            _sexview.view.frame = CGRectMake(0, 0, Width, Height);
            [self.view addSubview:_sexview.view];
        }else if (indexPath.row == 2){
            
            _dateview.view.frame = CGRectMake(0, 0, Width, Height);
            [self.view addSubview:_dateview.view];
        }else{
            self.index = indexPath;
            [self performSegueWithIdentifier:@"toupdata" sender:self];
        }
        
    }else{
        if(indexPath.row == 1){//安全退出（删除本地的数据）
            NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
            [user removeObjectForKey:@"OneUser"];
            [self.navigationController popViewControllerAnimated:YES];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"exit" object:nil userInfo:nil];
        }else{
            [self performSegueWithIdentifier:@"change" sender:self];
        }
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//将修改的数据上传到服务器
- (IBAction)SaveButton:(UIButton *)sender {
    //把数据传到服务器
    UserTool *utool = [[UserTool alloc] init];
    [utool Userid:self.uinfo.user_id username:self.uinfo.user_name uqq:self.uinfo.user_qq umail:self.uinfo.user_mail u_phone:self.uinfo.user_phone u_adress:self.uinfo.user_address u_phone2:self.uinfo.user_phone2 u_address2:self.uinfo.user_address2 u_sex:self.uinfo.user_sex u_birthday:self.uinfo.user_birthday success:^(UserLogin *content) {
        self.login = content;
        NSLog(@"修改状态---%@",content.content);
        
           }];
    
    //初始化一个UserLogin，进行归档
    
    [_ulogin.UserInforDic setValue:[NSString stringWithFormat:@"%d",_uinfo.user_id] forKey:@"user_id"];
    [_ulogin.UserInforDic setValue:[NSString stringWithFormat:@"%ld",(long)_uinfo.user_num] forKey:@"user_num"];
    [_ulogin.UserInforDic setValue:_uinfo.user_name forKey:@"user_name"];
    [_ulogin.UserInforDic setValue:_uinfo.user_password forKey:@"user_password"];
    [_ulogin.UserInforDic setValue:[NSString stringWithFormat:@"%d",_uinfo.user_status] forKey:@"user_status"];
    [_ulogin.UserInforDic setValue:[NSString stringWithFormat:@"%ld",(long)_uinfo.user_integral] forKey:@"user_integral"];
    [_ulogin.UserInforDic setValue:_uinfo.user_qq forKey:@"user_qq"];
    [_ulogin.UserInforDic setValue:_uinfo.user_sex forKey:@"user_sex"];
    [_ulogin.UserInforDic setValue:_uinfo.user_birthday forKey:@"user_birthday"];
    [_ulogin.UserInforDic setValue:_uinfo.user_mail forKey:@"user_mail"];
    [_ulogin.UserInforDic setValue:_uinfo.user_phone forKey:@"user_phone"];
    [_ulogin.UserInforDic setValue:_uinfo.user_address forKey:@"user_address"];
    [_ulogin.UserInforDic setValue:_uinfo.user_phone2 forKey:@"user_phone2"];
    [_ulogin.UserInforDic setValue:_uinfo.user_address2 forKey:@"user_address2"];
    [_ulogin.UserInforDic setValue:_uinfo.user_addtime forKey:@"user_addtime"];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_ulogin];//把对象转化为二进制
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];//从沙盒中取出来
    [user setObject:data forKey:@"OneUser"];//存入沙盒
    
    //写后发现可以从服务器返回来一个词典。。。可存为Login对象，可以直接把该对象进行归档。
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toupdata"]) {
        UpDataViewController *updataview = segue.destinationViewController;
        updataview.indexpx = self.index;
        updataview.info = self.uinfo;
    }else{
        ChangePassViewController *change = segue.destinationViewController;
        change.uerid = self.uinfo.user_id;
    }
}


@end
