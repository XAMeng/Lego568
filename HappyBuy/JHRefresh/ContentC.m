//
//  ContentC.m
//  AFNetwork
//
//  Created by echo24 on 15/9/23.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "ContentC.h"

@implementation ContentC
-(void)getvalue:(NSDictionary *)dic{
    self.comments = [dic[@"comments"] integerValue];
    self.wid = [dic[@"wid"] integerValue];
    self.update_time = dic[@"update_time"];
    self.wbody = dic[@"wbody"];
    self.likes = dic[@"likes"];
//    self.is_gif = dic[@""];
    self.wpic_middle = dic[@"wpic_middle"];
    self.wpic_m_height = [dic[@"wpic_m_height"] floatValue];
    self.vsource_url = dic[@"vsource_url"];
    self.vpic_small = dic[@"vpic_small"];
    self.vplay_url = dic[@"vplay_url"];
}
@end
