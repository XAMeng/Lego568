//
//  City.m
//  HappyBuy568
//
//  Created by echo24 on 15/9/25.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "City.h"

@implementation City
-(void)setValuefordic:(NSDictionary *)diction{
    self.city_id = diction[@"city_id"];
    self.city_name = diction[@"city_name"];
}
@end
