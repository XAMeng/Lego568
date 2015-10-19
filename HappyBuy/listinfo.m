//
//  listinfo.m
//  HappyBuy
//
//  Created by echo24 on 15/10/9.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "listinfo.h"

@implementation listinfo
-(void)setValueForListInfo:(NSDictionary *)dic{
    self.info_id = [dic[@"info_id"] intValue];
    self.info_title = dic[@"info_title"];
    self.info_imgs = dic[@"info_imgs"];
    self.info_link = dic[@"info_link"];
    self.info_type = [dic[@"info_type"] intValue];
    self.info_addtime = dic[@"info_addtime"];
    self.info_money = dic[@"info_money"];
    self.info_address = dic[@"info_address"];
}
@end
