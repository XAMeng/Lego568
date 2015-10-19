//
//  UserInfo.m
//  HappyBuy
//
//  Created by echo24 on 15/10/5.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo
-(void)SetValueForUserInfo:(NSDictionary *)dic{
    
    self.user_id = [dic[@"user_id"] intValue];
    self.user_num = [dic[@"user_num"] integerValue];
    self.user_name = dic[@"user_name"];
    self.user_password = dic[@"user_password"];
    self.user_status = dic[@"user_status"];
    self.user_integral = [dic[@"user_integral"] integerValue];
    self.user_qq = dic[@"user_qq"];
    self.user_sex = dic[@"user_sex"];
    self.user_birthday = dic[@"user_birthday"];
    self.user_mail = dic[@"user_mail"];
    self.user_phone = dic[@"user_phone"];
    self.user_address = dic[@"user_address"];
    self.user_phone2 = dic[@"user_phone2"];
    self.user_address2 = dic[@"user_address2"];
    self.user_addtime = dic[@"user_addtime"];
    self.vip = dic[@"vip"];
    self.next_integral = dic[@"next_integral"];
    self.mybill = dic[@"mybill"];
    self.vip_content = dic[@"vip_content"];
}

@end
