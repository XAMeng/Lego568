//
//  orlist.h
//  HappyBuy
//
//  Created by echo24 on 15/10/15.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface orlist : NSObject
@property (nonatomic,assign)int cart_id;
@property (nonatomic,assign)int user_id;
@property (nonatomic,assign)int goods_id;
@property (nonatomic,strong)NSString *goods_name;
@property (nonatomic,strong)NSString *goods_number;
@property (nonatomic,strong)NSString *goods_price;
@property (nonatomic,strong)NSString *goods_marke_price;
@property (nonatomic,strong)NSString *goods_imgs;

-(void)setvalueforlist:(NSDictionary *)dic;
@end
