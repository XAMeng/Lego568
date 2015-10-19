//
//  small_company_type.m
//  HappyBuy
//
//  Created by echo24 on 15/9/26.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "small_company_type.h"

@implementation small_company_type
-(void)SetForsmall_company:(NSDictionary *)dic{
    self.company_type_id = [dic[@"company_type_id"] integerValue];
    self.company_type_name = dic[@"company_type_name"];
    self.company_type_ico = dic[@"company_type_ico"];
    
    NSArray *array = dic[@"company"];
    NSMutableArray *Muarr = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in array) {
        Store *sto = [[Store alloc] init];
        [sto setValueDictionary:dic];
        [Muarr addObject:sto];
    }
    self.company = Muarr;
}
@end
