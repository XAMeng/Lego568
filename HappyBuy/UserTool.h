//
//  UserTool.h
//  HappyBuy
//
//  Created by echo24 on 15/10/6.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserLogin.h"
#import "myOrder.h"

@interface UserTool : NSObject
//用户发表评论
-(void)SendComment:(NSString *)content Uid:(int)userid comid:(int)comid success:(void(^)(NSString *result))success;
//举报店家
-(void)ReportCompany:(NSString *)report_content Uid:(int)user_id comid:(int)company_id success:(void(^)(NSString *result))success;
//添加收藏
-(void)AddCollect:(int)goodid userid:(int)uid success:(void(^)(NSString *content,BOOL status))sucess;
//加入购物车
-(void)AddBuyCar:(int)goodid userid:(int)uid goodnumber:(int)number success:(void(^)(NSString *content))sucess;
//修改用户信息
-(void)Userid:(int)uid username:(NSString *)uname uqq:(NSString *)qq umail:(NSString *)u_mail u_phone:(NSString *)uphopne u_adress:(NSString *)address u_phone2:(NSString *)phone2 u_address2:(NSString *)address2 u_sex:(NSString *)sex u_birthday:(NSString *)birthday success:(void(^)(UserLogin *content))success;
//修改密码
-(void)Userid:(int)userid oldpass:(NSString *)oldpassword newpass:(NSString *)newspassword newpass1:(NSString *)newpass1 success:(void(^)(UserLogin *content))suecss;
//获取订单信息
-(void)getoederimgs:(int)uid success:(void(^)(NSArray *arr))sucess;
//获取订单详细信息
-(void)getdetailmess:(NSString *)snid suceess:(void(^)(myOrder *myder))sucess;
//取消订单
-(void)cancelorder:(NSString *)order_sn sucess:(void(^)(NSString *cancel))sucess;
//购物车信息
-(void)buycarcenter:(int)uid sucess:(void(^)(NSArray *array))sucess;
//修改购物车商品数量
-(void)UpdataBuycar:(int)goodid goodnumber:(NSString *)number userid:(int)uid sucess:(void(^)(NSString *result))sucess;
//删除购物车中某件商品
-(void)deleteGoods:(int)goodid userid:(int)uid sucess:(void(^)(NSString *result))sucess;
//提交订单
-(void)Submit:(NSString *)order_consignee address:(NSString *)order_address tel:(NSString *)order_tel remarks:(NSString *)order_remarks uid:(int)user_id payid:(int)order_pay_id delivery:(int)order_delivery gid:(NSString *)goods_id sucess:(void(^)(NSString *result))sucess;
//我的收藏
-(void)usid:(int)uid sucess:(void(^)(NSArray *collect))sucess;
//取消收藏
-(void)CollectCancle:(int)collectID sucess:(void(^)(NSString *result))sucess;
//我发布信息列表
-(void)Information:(int)uid sucess:(void(^)(NSArray *collect))sucess;

@end
