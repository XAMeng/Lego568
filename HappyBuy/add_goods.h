//
//  add_goods.h
//  HappyBuy
//
//  Created by echo24 on 15/10/6.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface add_goods : NSObject

/**
 货物ID
 */
@property (nonatomic,assign)int goods_id;
/**
 货物名称
 */
@property (nonatomic,strong)NSString *goods_name;
/**
 货物广告
 */
@property (nonatomic,strong)NSString *goods_ad;
/**
 内容页网址
 */
@property (nonatomic,strong)NSString *goods_url;

-(void)SetValueForadd_goods:(NSDictionary *)dic;
@end
