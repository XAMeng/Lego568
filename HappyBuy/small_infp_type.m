//
//  small_infp_type.m
//  HappyBuy
//
//  Created by echo24 on 15/10/9.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "small_infp_type.h"

@implementation small_infp_type
-(void)setValueforSmall:(NSDictionary *)dic{
    self.info_type_id = [dic[@"info_type_id"] intValue];
    self.info_type_pid = [dic[@"info_type_pid"] intValue];
    self.info_type_name = dic[@"info_type_name"];
    self.info_type_ico = dic[@"info_type_name"];
    self.type_link = dic[@"type_link"];
}

@end
