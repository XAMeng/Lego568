//
//  StoreServer.h
//  HappyBuy568
//
//  Created by echo24 on 15/9/25.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Store.h"
#import "UserLogin.h"
@interface StoreServer : NSObject
//获取引导页路径
-(void)getADStoreObject:(int)city_id success:(void(^)(Store *store))success;
//获取推荐店铺信息
-(void)getStoreimge:(int)city_id success:(void(^)(NSArray *storeArray))sucess;
//获取滚动广告
-(void)getScrollerAd:(int)city_id sucess:(void(^)(NSArray *adArray))success;
//获取店铺信息
-(void)getCompanyImage:(int)city_id sucess:(void(^)(NSArray *imgArray))success;
//获取店铺详细信息
-(void)getStoreDetail:(int)city_id companyID:(int)comID sucess:(void(^)(Store *store))success;
//用户登陆
-(void)LoginServer:(NSString *)u_name pass:(NSString *)u_password success:(void(^)(UserLogin *content))success;
@end
