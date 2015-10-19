//
//  shopContent.m
//  HappyBuy
//
//  Created by echo24 on 15/10/7.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "shopContent.h"

@implementation shopContent
-(void)SetValueForShopContent:(NSDictionary *)dic{
    self.shop_id = [dic[@"shop_id"] intValue];
    self.shop_name = dic[@"shop_name"];
    self.shop_password = dic[@"shop_password"];
    self.shop_contact = dic[@"shop_contact"];
    self.shop_tel = dic[@"shop_tel"];
    self.shop_address = dic[@"shop_address"];
    self.shop_about = dic[@"shop_about"];
    self.city_id = [dic[@"city_id"] intValue];
    self.shop_main = dic[@"shop_main"];
    self.shop_status = [dic[@"shop_status"] intValue];
    self.shop_listorder = [dic[@"shop_listorder"] intValue];
    self.shop_ico = dic[@"shop_ico"];
    self.shop_server1 = dic[@"shop_server1"];
    self.shop_server2 = dic[@"shop_server2"];
    self.shop_server3 = dic[@"shop_server3"];
    self.shop_server4 = dic[@"shop_server4"];
    self.shop_server5 = dic[@"shop_server5"];


}
@end
