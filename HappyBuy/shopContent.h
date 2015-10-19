//
//  shopContent.h
//  HappyBuy
//
//  Created by echo24 on 15/10/7.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shopContent : NSObject
@property (nonatomic,assign)int shop_id;
@property (nonatomic,strong)NSString *shop_name;
@property (nonatomic,strong)NSString *shop_password;
@property (nonatomic,strong)NSString *shop_contact;
@property (nonatomic,strong)NSString *shop_tel;
@property (nonatomic,strong)NSString *shop_address;
@property (nonatomic,strong)NSString *shop_about;
@property (nonatomic,assign)int city_id;
//主营商品ID
@property (nonatomic,strong)NSString *shop_main;
@property (nonatomic,assign)int shop_status;
//商品排序
@property (nonatomic,assign)int shop_listorder;
//商品图标
@property (nonatomic,strong)NSString *shop_ico;
@property (nonatomic,strong)NSString *shop_server1;
@property (nonatomic,strong)NSString *shop_server2;
@property (nonatomic,strong)NSString *shop_server3;
@property (nonatomic,strong)NSString *shop_server4;
@property (nonatomic,strong)NSString *shop_server5;

-(void)SetValueForShopContent:(NSDictionary *)dic;
@end
