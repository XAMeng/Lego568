//
//  StoreComment.h
//  HappyBuy
//
//  Created by echo24 on 15/9/28.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoreComment : NSObject
/**
 评论ID
 */
@property (nonatomic,assign)NSInteger comment_id;
/**
 用户ID
 */
@property (nonatomic,assign)NSInteger user_id;
/**
 店铺ID
 */
@property (nonatomic,assign)NSInteger company_id;
/**
 评论内容
 */
@property (nonatomic,strong)NSString *comment_content;
/**
 评论时间
 */
@property (nonatomic,strong)NSString *comment_addtime;
/**
 用户姓名
*/
@property (nonatomic,strong)NSString *user_name;
-(void)SetStorecom:(NSDictionary *)dic;
@end
