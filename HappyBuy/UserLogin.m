//
//  UserLogin.m
//  HappyBuy
//
//  Created by echo24 on 15/10/5.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "UserLogin.h"

@implementation UserLogin
//归档解档
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:[NSString stringWithFormat:@"%d",self.status] forKey:@"status"];
    [aCoder encodeObject:self.content forKey:@"content"];
    [aCoder encodeObject:self.UserInforDic forKey:@"UserInforDic"];
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.status = [aDecoder decodeObjectForKey:@"status"];
        self.content = [aDecoder decodeObjectForKey:@"content"];
        self.UserInforDic = [aDecoder decodeObjectForKey:@"UserInforDic"];
    }
    return self;
}


//给赋值
-(void)SetValueForLogin:(NSDictionary *)dic{
    self.status = dic[@"status"];
    self.content = dic[@"content"];
    self.UserInforDic = dic[@"userinfo"];
}
@end
