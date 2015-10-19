//
//  City.h
//  HappyBuy568
//
//  Created by echo24 on 15/9/25.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject
@property (nonatomic,strong)NSString *city_id;
@property (nonatomic,strong)NSString *city_name;
-(void)setValuefordic:(NSDictionary *)diction;
@end
