//
//  companyType.h
//  HappyBuy
//
//  Created by echo24 on 15/9/26.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "Store.h"
#import "small_company_type.h"
#import <Foundation/Foundation.h>

@interface companyType : NSObject
@property (nonatomic,assign)NSInteger company_type_id;
@property (nonatomic,strong)NSString *company_type_name;
@property (nonatomic,strong)NSString *company_type_ico;
@property (nonatomic,strong)NSString *company_type_url;
@property (nonatomic,strong)NSArray *Company_add;
@property (nonatomic,strong)NSArray *small_company_type;
@property (nonatomic,strong)Store *store;
@property (nonatomic,assign)BOOL isClose;
-(void)SetforDicSetValue:(NSDictionary *)dic;
@end
