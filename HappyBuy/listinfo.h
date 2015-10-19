//
//  listinfo.h
//  HappyBuy
//
//  Created by echo24 on 15/10/9.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface listinfo : NSObject
/**
 信息ID
 */
@property (nonatomic,assign)int info_id;
/**
 信息标题
 */
@property (nonatomic,strong)NSString *info_title;
/**
 信息图片
 */
@property (nonatomic,strong)NSString *info_imgs;
/**
 信息链接
 */
@property (nonatomic,strong)NSString *info_link;
/**
 信息类型
 */
@property (nonatomic,assign)int info_type;
/**
 信息添加时间
 */
@property (nonatomic,strong)NSString *info_addtime;
/**
 价钱
 */
@property (nonatomic,strong)NSString *info_money;
/**
 地址
 */
@property (nonatomic,strong)NSString *info_address;
//赋值方法
-(void)setValueForListInfo:(NSDictionary *)dic;

@end
