//
//  message.h
//  HappyBuy
//
//  Created by echo24 on 15/10/9.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Detail_Info.h"
@interface message : NSObject
-(void)getGoodsImg:(int)city_id success:(void(^)(NSArray *Array))sucess;
-(void)getMessDetail:(int)info_id success:(void(^)(Detail_Info *det_info))sucess;
//获取配置福利
-(void)getpezhi:(int)info_type_pid info_id:(int)info_type_id sucess:(void(^)(NSArray *arr))sucess;

//发布房产信息
-(void)PushHouseMessage:(int)cityid usid:(int)userid type_id:(int)type_id title:(NSString *)title imgArr:(NSArray *)imgs contact:(NSString *)contact phone:(NSString *)phone home_price:(NSString *)price homeadress:(NSString *)adress config:(NSString *)config;
//发布招聘信息
-(void)PushRecruitMessage:(int)cityid usid:(int)userid type_id:(int)type_id title:(NSString *)title imgArr:(NSArray *)imgs contact:(NSString *)contact phone:(NSString *)phone position:(NSString *)position salary:(NSString *)salary weal:(NSString *)weal number:(NSString *)number request:(NSString *)request companyname:(NSString *)name companytro:(NSString *)introduce;

@end
