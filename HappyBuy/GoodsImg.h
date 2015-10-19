//
//  GoodsImg.h
//  HappyBuy
//
//  Created by echo24 on 15/10/6.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsImg : NSObject
/**
 商品类型ID
 */
@property (nonatomic,assign)int goods_type_id;
/**
 商品类型名字
 */
@property (nonatomic,strong)NSString *goods_type_name;
/**
 单个商品
 */
@property (nonatomic,strong)NSArray *add_goods;
/**
 单个商品
 */
@property (nonatomic,strong)NSArray *listgoods;

-(void)SetValueForGoods:(NSDictionary *)dic;
@end
