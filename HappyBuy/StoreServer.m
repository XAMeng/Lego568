//
//  StoreServer.m
//  HappyBuy568
//
//  Created by echo24 on 15/9/25.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "StoreServer.h"
#import "RequestMethod.h"
#import "companyType.h"

@implementation StoreServer
/**
 获取引导页的路径
 */
-(void)getADStoreObject:(int)city_id success:(void(^)(Store *store))success{
    Store *store = [[Store alloc] init];
    NSString *url = @"index.php/Home/API/yindaoCompany/city_id/2";
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        [store setValueDictionary:dic];
        success(store);
    } failure:^(NSError *err) {
        NSLog(@"error == %@",err);
    }];
        
}
/**
 获取推荐店铺信息
 */
-(void)getStoreimge:(int)city_id success:(void(^)(NSArray *storeArray))sucess{
    
    NSString *url = @"index.php/Home/API/recommendCompany/city_id/2";
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSArray *array = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *muarr = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in array) {
            Store *store = [[Store alloc] init];
            [store setValueDictionary:dic];
            [muarr addObject:store];
        }
        sucess(muarr);
    } failure:^(NSError *err) {
        NSLog(@"%@",err);
    }];
}
/**
 获取滚动广告
 */
-(void)getScrollerAd:(int)city_id sucess:(void(^)(NSArray *adArray))success{
    NSString *url = @"index.php/Home/API/CompanyType/city_id/2/";
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSArray *array = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *muArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in array) {
            NSArray *Adarray = dic[@"add_company"];
            for (NSDictionary *miniDic in Adarray) {
                Store *sto = [[Store alloc] init];
                [sto setValueDictionary:miniDic];
                [muArray addObject:sto];
            }
        }
        success(muArray);
    } failure:^(NSError *err) {
        NSLog(@"error == %@",err);
    }];
}
/**
 获取店铺信息
 */
-(void)getCompanyImage:(int)city_id sucess:(void(^)(NSArray *imgArray))success{
    NSString *url = @"index.php/Home/API/CompanyType/city_id/2/";
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSArray *array = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *Muarray = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in array) {
            companyType *comtype = [[companyType alloc] init];
            [comtype SetforDicSetValue:dic];
            [Muarray addObject:comtype];
        }
        success(Muarray);
    } failure:^(NSError *err) {
        NSLog(@"error == %@",err);
    }];
}
/**
 获取店铺详细信息
 */
-(void)getStoreDetail:(int)city_id companyID:(int)comID sucess:(void(^)(Store *store))success{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/API/content_company/company_id/%d",comID];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        Store *sto = [[Store alloc] init];
        [sto setValueDictionary:dic];
        NSLog(@"sto == %@",sto);
        success(sto);
    } failure:^(NSError *err) {
        NSLog(@"error == %@",err);
    }];
}
//用户登陆,获取用户信息
-(void)LoginServer:(NSString *)u_name pass:(NSString *)u_password success:(void(^)(UserLogin *content))success{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIuser/loginUser/user_phone/%@/user_password/%@",u_name,u_password];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        UserLogin *ulogin = [[UserLogin alloc] init];
        [ulogin SetValueForLogin:dic];
        success(ulogin);
    } failure:^(NSError *err) {
        NSLog(@"error == %@",err);
    }];
}


@end
