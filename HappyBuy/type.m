//
//  type.m
//  HappyBuy
//
//  Created by echo24 on 15/10/9.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "type.h"
#import "small_infp_type.h"
#import "listinfo.h"
@implementation type

-(void)SetVAlueFortype:(NSDictionary *)dic{
    self.info_type_id = [dic[@"info_type_id"]intValue];
    self.info_type_pid = [dic[@"info_type_pid"] intValue];
    self.info_type_name = dic[@"info_type_name"];
    self.info_type_ico = dic[@"info_type_ico"];
    NSArray *arr = dic[@"small_infp_type"];
    NSMutableArray *muarray = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        small_infp_type *small = [[small_infp_type alloc] init];
        [small setValueforSmall:dic];
        [muarray addObject:small];
    }
    self.small_infp_type = muarray;
    
    NSArray *arr2 = dic[@"listinfo"];
    NSMutableArray *muarr = [NSMutableArray array];
    for (NSDictionary *dic in arr2) {
        listinfo *list = [[listinfo alloc] init];
        [list setValueForListInfo:dic];
        [muarr addObject:list];
    }
    self.selectnum = 0;
    self.listinfo = muarr;
}
@end
