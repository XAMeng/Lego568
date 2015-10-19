//
//  ContentC.h
//  AFNetwork
//
//  Created by echo24 on 15/9/23.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentC : NSObject
/**
 段子的id
 */
@property (nonatomic,assign) NSInteger wid;
/**
 段子的评论数
 */
@property (nonatomic,assign) NSInteger comments;
/**
 段子的赞
 */
@property (nonatomic,strong) NSString *likes;
/**
 段子的时间戳
 */
@property (nonatomic,strong) NSString *update_time;
/**
 段子的内容
 */
@property (nonatomic,strong) NSString *wbody;
/**
 图片的地址
 */
@property (nonatomic,strong) NSString *wpic_middle;
/**
 图片的高度
 */
@property (nonatomic,assign)CGFloat wpic_m_height;
/**
 图片是否GIF
 */
@property (nonatomic,assign)BOOL is_gif;
/**
 视频源
 */
@property (nonatomic,strong)NSString *vsource_url;
/**
 */
@property (nonatomic,strong)NSString *vpic_small;
@property (nonatomic,strong)NSString *vplay_url;
-(void)getvalue:(NSDictionary *)dic;
@end
