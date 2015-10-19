//
//  advertise.h
//  HappyBuy568
//
//  Created by echo24 on 15/9/25.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject
/**
 图片名字
 */
@property (nonatomic,strong)NSString *company_ad;
/**
 店铺连接
 */
@property (nonatomic,strong)NSString *company_url;
/**
 店铺id
 */
@property (nonatomic,assign)int company_id;
/**
 店铺logo
 */
@property (nonatomic,strong)NSString *company_ico;
/**
 店铺名字
 */
@property (nonatomic,strong)NSString *company_name;
/**
 店铺名缩写
 */
@property (nonatomic,strong)NSString *company_shortname;
/////////////////////////////////////////9.28添加
/**
 会员ID
 */
@property (nonatomic,assign)NSInteger user_id;
/**
 申请时间
 */
@property (nonatomic,strong)NSString *company_applytime;
/**
 开通时间
 */
@property (nonatomic,strong)NSString *company_throughtime;
/**
 店铺分类ID
 */
@property (nonatomic,assign)NSInteger company_type_id;
/**
 联系人
 */
@property (nonatomic,strong)NSString *company_contact;
/**
 店铺地址
 */
@property (nonatomic,strong)NSString *company_address;
/**
 店铺联系电话
 */
@property (nonatomic,strong)NSString *company_tel;
/**
 店铺简介
 */
@property (nonatomic,strong)NSString *company_about;
/**
 店铺指南
 */
@property (nonatomic,strong)NSString *company_guide;
/**
 店铺视频地址
 */
@property (nonatomic,strong)NSString *company_video;
/**
 店铺等级
 */
@property (nonatomic,assign)NSInteger company_level;
/**
 店铺浏览量
 */
@property (nonatomic,assign)NSInteger company_hits;
/**
 店铺所在城市ID
 */
@property (nonatomic,assign)NSInteger city_id;
/**
 店铺是否推荐
 */
@property (nonatomic,assign)NSInteger company_isrecommend;
/**
 店铺排序
 */
@property (nonatomic,assign)NSInteger company_listorder;
/**
 店铺是允许评论
*/
@property (nonatomic,assign)NSInteger company_iscomment;
/**
 店铺名片
*/
@property (nonatomic,strong)NSString *company_card;
/**
 分享网址
 */
@property (nonatomic,strong)NSString *share_url;
/**
 店铺分享标题
 */
@property (nonatomic,strong)NSString *share_title;
/**
 分享图片
 */
@property (nonatomic,strong)NSString *share_img;
/**
 分享内容
 */
@property (nonatomic,strong)NSString *share_content;


/**
 滚动视图
 */
@property (nonatomic,strong)NSMutableArray *company_imgs_new;
/**
 店铺评论
 */
@property (nonatomic,strong)NSArray *company_comment;
/**
 商品信息
 */
@property (nonatomic,strong)NSArray *company_pro;
-(void)setValueDictionary:(NSDictionary *)dic;
@end
