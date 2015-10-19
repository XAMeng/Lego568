//
//  orlist.m
//  HappyBuy
//
//  Created by echo24 on 15/10/15.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "orlist.h"

@implementation orlist
-(void)setvalueforlist:(NSDictionary *)dic{
    self.goods_id = [dic[@"goods_id"] intValue];
    self.goods_name = dic[@"goods_name"];
    self.goods_number = dic[@"goods_number"];
    self.goods_price = dic[@"goods_price"];
    self.goods_marke_price = dic[@"goods_marke_price"];
    self.goods_imgs = dic[@"goods_imgs"];
    self.user_id = [dic[@"user_id"] intValue];
    self.cart_id = [dic[@"cart_id"] intValue];
}
@end

