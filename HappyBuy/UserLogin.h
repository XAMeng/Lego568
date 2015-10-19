//
//  UserLogin.h
//  HappyBuy
//
//  Created by echo24 on 15/10/5.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserLogin : NSObject<NSCoding>
@property (nonatomic,assign)BOOL status;
@property (nonatomic,strong)NSDictionary *UserInforDic;
@property (nonatomic,strong)NSString *content;
-(void)SetValueForLogin:(NSDictionary *)dic;
@end
