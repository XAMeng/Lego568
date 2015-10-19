//
//  GoodsImg.m
//  HappyBuy
//
//  Created by echo24 on 15/10/6.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "GoodsImg.h"

@implementation GoodsImg
-(void)SetValueForGoods:(NSDictionary *)dic{
    self.goods_type_id = [dic[@"goods_type_id"] intValue];
    self.goods_type_name = dic[@"goods_type_name"];
    self.add_goods = dic[@"add_goods"];
    self.listgoods = dic[@"listgoods"];
}
@end
