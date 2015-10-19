//
//  type.h
//  HappyBuy
//
//  Created by echo24 on 15/10/9.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface type : NSObject
/**
 一级分类ID
 */
@property (nonatomic,assign)int info_type_id;
/**
 一级分类父ID
 */
@property (nonatomic,assign)int info_type_pid;
/**
 一级分类名称
 */
@property (nonatomic,strong)NSString *info_type_name;
/**
一级分类图标
 */
@property (nonatomic,assign) int selectnum;
@property (nonatomic,strong)NSString *info_type_ico;
@property (nonatomic,strong)NSArray *small_infp_type;
@property (nonatomic,strong)NSArray *listinfo;
//给数据赋值
-(void)SetVAlueFortype:(NSDictionary *)dic;
@end
