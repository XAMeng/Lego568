
//
//  companyType.m
//  HappyBuy
//
//  Created by echo24 on 15/9/26.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//
//#import "Store.h"
#import "companyType.h"

@implementation companyType
-(void)SetforDicSetValue:(NSDictionary *)dic{
    self.company_type_id = [dic[@"company_type_id"] integerValue];
    self.company_type_name = dic[@"company_type_name"];
    self.company_type_ico = dic[@"company_type_ico"];
    self.company_type_url = dic[@"company_type_url"];
    
    
    NSArray *arr = dic[@"add_company"];
    NSMutableArray *Muarray = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in arr) {
        Store *sto = [[Store alloc] init];
        [sto setValueDictionary:dic];
        [Muarray addObject:sto];
    }
    self.Company_add = Muarray;
    
    NSArray *arr2 = dic[@"small_company_type"];
    NSMutableArray *Muarray2 = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in arr2) {
        small_company_type * small = [[small_company_type alloc] init];
        [small SetForsmall_company:dic];
        [Muarray2 addObject:small];
    }
    self.small_company_type = Muarray2;
}
@end
