//
//  myOrder.m
//  HappyBuy
//
//  Created by echo24 on 15/10/15.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "myOrder.h"

@implementation myOrder
-(void)setvalueformyorder:(NSDictionary *)dic{
    self.order_id = [dic[@"order_id"] intValue];
    self.user_id = [dic[@"user_id"] intValue];
    self.order_pay_id = [dic[@"order_pay_id"] intValue];
    self.order_status = dic[@"order_status"];
    self.order_pay_status = dic[@"order_pay_status"];
    self.order_delivery = dic[@"order_delivery"];
    self.order_sn = dic[@"order_sn"];
    self.order_consignee = dic[@"order_consignee"];
    self.order_address = dic[@"order_address"];
    self.order_tel = dic[@"order_tel"];
    self.order_amount = dic[@"order_amount"];
    self.order_addtime = dic[@"order_addtime"];
    self.order_edittime = dic[@"order_edittime"];
    self.order_remarks = dic[@"order_remarks"];
    self.order_status_text = dic[@"order_status_text"];
    self.order_pay_status_text = dic[@"order_pay_status_text"];
    self.listgoods = dic[@"listgoods"];
}


@end
