//
//  add_goods.m
//  HappyBuy
//
//  Created by echo24 on 15/10/6.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "add_goods.h"

@implementation add_goods
-(void)SetValueForadd_goods:(NSDictionary *)dic{
    self.goods_id = [dic[@"goods_id"] intValue];
    self.goods_name = dic[@"goods_name"];
    self.goods_ad = dic[@"goods_ad"];
    self.goods_url = dic[@"goods_url"];
}
@end
