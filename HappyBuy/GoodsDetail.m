//
//  GoodsDetail.m
//  HappyBuy
//
//  Created by echo24 on 15/10/7.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "GoodsDetail.h"

@implementation GoodsDetail
-(void)setValueForGoodsDe:(NSDictionary *)dic{
    self.goods_id = [dic[@"goods_id"] intValue];
    self.goods_type_id = [dic[@"goods_type_id"] intValue];
    self.goods_name = dic[@"goods_name"];
    self.goods_imgs = dic[@"goods_imgs"];
    self.goods_ad = dic[@"goods_ad"];
    self.goods_title = dic[@"goods_title"];
    self.goods_isnew = [dic[@"goods_isnew"] intValue];
    self.goods_sales = [dic[@"goods_sales"] intValue];
    self.goods_addtime = dic[@"goods_addtime"];
    self.goods_ishot = [dic[@"goods_ishot"] intValue];
    self.goods_price = dic[@"goods_price"];
    self.goods_marke_price = dic[@"goods_marke_price"];
    self.goods_number = dic[@"goods_number"];
    self.goods_content = dic[@"goods_content"];
    self.goods_status = [dic[@"goods_status"] intValue];
    self.shop_id = [dic[@"shop_id"] intValue];
    self.city_id = [dic[@"city_id"] intValue];
    self.goods_typename = dic[@"goods_typename"];
    self.goods_type_url = dic[@"goods_type_url"];
    self.goods_type_pid = [dic[@"goods_type_pid"] intValue];
    self.share_title = dic[@"share_title"];
    self.share_img = dic[@"share_img"];
    self.share_url = dic[@"share_url"];
    self.share_content = dic[@"share_content"];
    self.goods_imgs_new = dic[@"goods_imgs_new"];
    self.contentShop = dic[@"contentShop"];
    self.goods_type_name = dic[@"goods_type_name"];
    self.collect_id = [dic[@"collect_id"] intValue];
    self.user_id = [dic[@"user_id"] intValue];
    self.collect_addtime = dic[@"collect_addtime"];
}
@end
