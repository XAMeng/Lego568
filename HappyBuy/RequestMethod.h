//
//  RequestMethod.h
//  HappyBuy568
//
//  Created by echo24 on 15/9/25.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestMethod : NSObject
+(void)getLoadFileWith:(NSDictionary *)paramDic URL:(NSString *)url succes:(void(^)(id su))success failure:(void(^)(NSError *err))failure;
+(void)PostFileWith:(NSDictionary *)paramDic URL:(NSString *)url success:(void(^)(id data))success failure:(void(^)(NSError * err))failure;
@end
