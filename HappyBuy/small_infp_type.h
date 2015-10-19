//
//  small_infp_type.h
//  HappyBuy
//
//  Created by echo24 on 15/10/9.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface small_infp_type : NSObject
/**
 二级分类ID
 */
@property (nonatomic,assign)int info_type_id;
/**
 二级分类父ID
 */
@property (nonatomic,assign)int info_type_pid;
/**
 二级分类名称
 */
@property (nonatomic,strong)NSString *info_type_name;
/**
 二级分类图标
 */
@property (nonatomic,strong)NSString *info_type_ico;
/**
 分类列表链接
 */
@property (nonatomic,strong)NSString *type_link;
-(void)setValueforSmall:(NSDictionary *)dic;
@end
