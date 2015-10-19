//
//  listgoods.m
//  HappyBuy
//
//  Created by echo24 on 15/10/6.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "listgoods.h"

@implementation listgoods
-(void)SetValueForListGoods:(NSDictionary *)dic{
    self.goods_id = [dic[@"goods_id"] intValue];
    self.goods_imgs = dic[@"goods_imgs"];
    self.goods_name = dic[@"goods_name"];
    self.goods_url = dic[@"goods_url"];
}
@end
