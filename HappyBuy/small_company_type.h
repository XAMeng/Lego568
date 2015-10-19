//
//  small_company_type.h
//  HappyBuy
//
//  Created by echo24 on 15/9/26.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Store.h"

@interface small_company_type : NSObject
@property (nonatomic,assign)NSInteger company_type_id;
@property (nonatomic,strong)NSString *company_type_name;
@property (nonatomic,strong)NSString *company_type_ico;
@property (nonatomic,strong)NSArray *company;
-(void)SetForsmall_company:(NSDictionary *)dic;
@end
