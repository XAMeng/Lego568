//
//  GoodsDetail.h
//  HappyBuy
//
//  Created by echo24 on 15/10/7.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsDetail : NSObject
/**
 货物ID
 */
@property (nonatomic,assign)int goods_id;
/**
 货物类型ID
 */
@property (nonatomic,assign)int goods_type_id;
/**
 收藏ID
 */
@property (nonatomic,assign)int collect_id;
/**
 用户ID
 */
@property (nonatomic,assign)int user_id;
/**
 收藏时间
 */
@property (nonatomic,strong)NSString *collect_addtime;

/**
 货物名字
 */
@property (nonatomic,strong)NSString *goods_name;
/**
 货物图片
 */
@property (nonatomic,strong)NSString *goods_imgs;
/**
 货物广告
 */
@property (nonatomic,strong)NSString *goods_ad;
/**
 货物标题
 */
@property (nonatomic,strong)NSString *goods_title;
/**
 是否新品
 */
@property (nonatomic,assign)int goods_isnew;
/**
 销量
 */
@property (nonatomic,assign)int goods_sales;
/**
 商品添加时间
 */
@property (nonatomic,strong)NSString *goods_addtime;
/**
 是否热卖
 */
@property (nonatomic,assign)int goods_ishot;
/**
 商品价钱
 */
@property (nonatomic,strong)NSString *goods_price;
/**
 市场价
 */
@property (nonatomic,strong)NSString *goods_marke_price;
/**
 库存
*/
@property (nonatomic,strong)NSString *goods_number;
/**
 商品内容
 */
@property (nonatomic,strong)NSString *goods_content;
/**
 商品状态
 */
@property (nonatomic,assign)int goods_status;
/**
 商店ID
 */
@property (nonatomic,assign)int shop_id;
/**
 城市ID
 */
@property (nonatomic,assign)int city_id;
/**
 商品类型名
 */
@property (nonatomic,strong)NSString *goods_typename;
/**
 商品类型网站
 */
@property (nonatomic,strong)NSString *goods_type_url;
/**
 商品类型ID
 */
@property (nonatomic,assign)int goods_type_pid;
/**
 分享标题
 */
@property (nonatomic,strong)NSString *share_title;
/**
 分享图片
 */
@property (nonatomic,strong)NSString *share_img;
/**
 分享网址
 */
@property (nonatomic,strong)NSString *share_url;
/**
 分享内容
 */
@property (nonatomic,strong)NSString *share_content;
/**
 商品链接
 */
@property (nonatomic,strong)NSString *goods_link;
@property (nonatomic,strong)NSString *goods_type_name;

/**
 商品广告
 */
@property (nonatomic,strong)NSArray *goods_imgs_new;

/**
 商店内容
 */
@property (nonatomic,strong)NSDictionary *contentShop;


-(void)setValueForGoodsDe:(NSDictionary *)dic;
@end
