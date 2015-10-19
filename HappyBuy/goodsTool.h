//
//  goodsTool.h
//  HappyBuy
//
//  Created by echo24 on 15/10/6.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodsDetail.h"
@interface goodsTool : NSObject
//获取货物信息
-(void)getGoodsImg:(int)city_id success:(void(^)(NSArray *Array))sucess;
//获取货物信息详情
-(void)getDetailGoods:(int)goods_id success:(void(^)(GoodsDetail *goodDetail))sucess;
//获取分类信息
-(void)getTypeImg:(int)goods_type_pid goods_type_id:(int)goods_type_id city_id:(int)city_id list_order:(int)list_order page_num:(int)page_num page_size:(int)page_size success:(void(^)(NSArray *array,NSArray *arr))sucess;
@end
