//
//  myOrder.h
//  HappyBuy
//
//  Created by echo24 on 15/10/15.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myOrder : NSObject

@property (nonatomic,assign)int order_id;
@property (nonatomic,assign)int user_id;
@property (nonatomic,assign)BOOL order_status;
@property (nonatomic,assign)BOOL order_pay_status;
@property (nonatomic,assign)int order_pay_id;
@property (nonatomic,strong)NSString *order_delivery;
@property (nonatomic,strong)NSString *order_sn;
@property (nonatomic,strong)NSString *order_consignee;
@property (nonatomic,strong)NSString *order_address;
@property (nonatomic,strong)NSString *order_tel;
@property (nonatomic,strong)NSString *order_amount;
@property (nonatomic,strong)NSString *order_addtime;
@property (nonatomic,strong)NSString *order_edittime;
@property (nonatomic,strong)NSString *order_remarks;
@property (nonatomic,strong)NSString *order_status_text;
@property (nonatomic,strong)NSString *order_pay_status_text;
@property (nonatomic,strong)NSArray *listgoods;
-(void)setvalueformyorder:(NSDictionary *)dic;
@end
