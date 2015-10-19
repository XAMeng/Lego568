//
//  RequestMethod.m
//  HappyBuy568
//
//  Created by echo24 on 15/9/25.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "RequestMethod.h"
#import "AFNetworking.h"
@implementation RequestMethod
/**
 url请求路径
 sucess成功的回调代理
 failure失败的回调
 */
+(void)getLoadFileWith:(NSDictionary *)paramDic URL:(NSString *)url succes:(void(^)(id su))success failure:(void(^)(NSError *err))failure{
    //创建请求管理对象
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    //设置返回的格式 不让af自动解析 返回二进制
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    //发生请求
    [manger GET:url parameters:paramDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    }

/**
 POST请求方法
 url请求路径
 sucess成功的回调代理
 failure失败的回调
 */
+(void)PostFileWith:(NSDictionary *)paramDic URL:(NSString *)url success:(void(^)(id data))success failure:(void(^)(NSError * err))failure{
    //创建请求管理对象
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    //设置返回的格式 不让af自动解析 返回二进制
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manger POST:url parameters:paramDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
