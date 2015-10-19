//
//  companyPro.h
//  HappyBuy
//
//  Created by echo24 on 15/9/28.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface companyPro : NSObject
/**
 产品ID
 */
@property (nonatomic,assign)NSInteger company_pro_id;
/**
 产品图片
 */
@property (nonatomic,strong)NSString *company_pro_imgsrc;
/**
 产品名字
 */
@property (nonatomic,strong)NSString *company_pro_title;
/**
 产品内容简介
 */
@property (nonatomic,strong)NSString *company_pro_content;
/**
 产品信息
 */
@property (nonatomic,strong)NSString *company_pro_remarks;
/**
 店铺ID
 */
@property (nonatomic,assign)NSInteger company_id;
/**
 产品排序
 */
@property (nonatomic,assign)NSInteger company_pro_listorder;
-(void)SetforcomPro:(NSDictionary *)dic;
@end
