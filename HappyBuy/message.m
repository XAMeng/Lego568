//
//  message.m
//  HappyBuy
//
//  Created by echo24 on 15/10/9.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "message.h"
#import "RequestMethod.h"
#import "type.h"
@implementation message
-(void)getGoodsImg:(int)city_id success:(void(^)(NSArray *Array))sucess{
    NSString *url = @"index.php/Home/APIinfo/typeInfo/city_id/2";
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *array = [NSMutableArray array];
        NSArray *arr = dic[@"type"];
        for (NSDictionary *dic in arr) {
            type *t = [[type alloc] init];
            [t SetVAlueFortype:dic];
            [array addObject:t];
        }
        sucess(array);
    } failure:^(NSError *err) {
        NSLog(@"Error == %@",err);
    }];
}

-(void)getMessDetail:(int)info_id success:(void(^)(Detail_Info *det_info))sucess{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIinfo/contentInfo/info_id/%d",info_id];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        Detail_Info *detail = [[Detail_Info alloc] init];
        [detail SetValueforDetailInfo:dic];
        sucess(detail);
    } failure:^(NSError *err) {
        NSLog(@"error == %@",err);
    }];
}

//获取配置或福利
-(void)getpezhi:(int)info_type_pid info_id:(int)info_type_id sucess:(void(^)(NSArray *arr))sucess{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIinfo/addInfoconfig/info_type_pid/%d/info_type_id/%d",info_type_pid,info_type_id];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *Muarray = [NSMutableArray array];
        for (NSDictionary *dic in arr) {
            NSString *name = dic[@"name"];
            [Muarray addObject:name];
        }
        sucess(Muarray);
    } failure:^(NSError *err) {
        NSLog(@"请求失败");
    }];
}
@end
