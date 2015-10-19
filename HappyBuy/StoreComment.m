//
//  StoreComment.m
//  HappyBuy
//
//  Created by echo24 on 15/9/28.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "StoreComment.h"

@implementation StoreComment
-(void)SetStorecom:(NSDictionary *)dic{
    self.company_id = [dic[@"comment_id"] integerValue];
    self.user_id = [dic[@"user_id"] integerValue];
    self.company_id = [dic[@"company_id"] integerValue];
    self.comment_content = dic[@"comment_content"];
    self.comment_addtime = dic[@"comment_addtime"];
    self.user_name = dic[@"user_name"];
    
}
@end
