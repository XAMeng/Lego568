//
//  goodsTool.m
//  HappyBuy
//
//  Created by echo24 on 15/10/6.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "goodsTool.h"
#import "RequestMethod.h"
#import "GoodsImg.h"
@implementation goodsTool
//获取货物所有对象的方法
-(void)getGoodsImg:(int)city_id success:(void(^)(NSArray *Array))sucess{
    NSString *url = @"index.php/Home/APIgoods/goodsType/city_id/2";
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *muarr = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in arr) {
            GoodsImg *gdimg = [[GoodsImg alloc] init];
            [gdimg SetValueForGoods:dic];
            [muarr addObject:gdimg];
        }
        sucess(muarr);
    } failure:^(NSError *err) {
        NSLog(@"err = %@",err);
    }];
}
//获取商品详细信息
-(void)getDetailGoods:(int)goods_id success:(void(^)(GoodsDetail *goodDetail))sucess{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIgoods/contentGoods/goods_id/%d",goods_id];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        GoodsDetail *goods = [[GoodsDetail alloc] init];
        [goods setValueForGoodsDe:dic];
        sucess(goods);
    } failure:^(NSError *err) {
        NSLog(@"err == %@",err);
    }];
}

//获取货物分类信息
-(void)getTypeImg:(int)goods_type_pid goods_type_id:(int)goods_type_id city_id:(int)city_id list_order:(int)list_order page_num:(int)page_num page_size:(int)page_size success:(void(^)(NSArray *array,NSArray *arr))sucess{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIgoods/listGoods/goods_type_pid/%d/goods_type_id/%d/city_id/2/list_order/%d/page_num/%d/page_size/10",goods_type_pid,goods_type_id,list_order,page_num];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        NSArray *Array = dic[@"listGoods"];
        NSMutableArray *arr = [NSMutableArray array];
        NSArray *Array2 = dic[@"listType"];
        for (NSDictionary *dic2 in Array) {
            GoodsDetail *detail = [[GoodsDetail alloc] init];
            [detail setValueForGoodsDe:dic2];
            [arr addObject:detail];
        }
        NSMutableArray *arr2 = [NSMutableArray array];
        for (NSDictionary *dic in Array2) {
            GoodsDetail *detail = [[GoodsDetail alloc] init];
            [detail setValueForGoodsDe:dic];
            [arr2 addObject:detail];
        }
        sucess(arr,arr2);
    } failure:^(NSError *err) {
        NSLog(@"erroer == %@",err);
    }];
}
@end

