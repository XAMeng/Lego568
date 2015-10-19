//
//  UserInfo.h
//  HappyBuy
//
//  Created by echo24 on 15/10/5.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject
//会员ID
@property (nonatomic,assign)int user_id;
//会员编号
@property (nonatomic,assign)NSInteger user_num;
//手机号
@property (nonatomic,strong)NSString *user_name;
//密码
@property (nonatomic,strong)NSString *user_password;
//登录状态
@property (nonatomic,assign)BOOL user_status;
//会员积分
@property (nonatomic,assign)NSInteger user_integral;
//QQ号码
@property (nonatomic,strong)NSString *user_qq;
//性别
@property (nonatomic,strong)NSString *user_sex;
//出生日期
@property (nonatomic,strong)NSString *user_birthday;
//电子邮箱
@property (nonatomic,strong)NSString *user_mail;
//手机号码
@property (nonatomic,strong)NSString *user_phone;
//用户地址
@property (nonatomic,strong)NSString *user_address;
//用户电话2
@property (nonatomic,strong)NSString *user_phone2;
//用户地址2
@property (nonatomic,strong)NSString *user_address2;
//会员注册时间
@property (nonatomic,strong)NSString *user_addtime;
//会员VIP等级
@property (nonatomic,strong)NSString *vip;
//距下一级还差的积分
@property (nonatomic,strong)NSString *next_integral;
//账单信息
//"mybill": "http://www.lg568.com/index.php/Home/Index/mybill/id/43"
@property (nonatomic,strong)NSString *mybill;
//VIP内容
@property (nonatomic,strong)NSString *vip_content;

-(void)SetValueForUserInfo:(NSDictionary *)dic;

@end
