//
//  Detail_Info.h
//  HappyBuy
//
//  Created by echo24 on 15/10/10.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Detail_Info : NSObject
@property (nonatomic,assign)int info_id;
@property (nonatomic,assign)int user_id;
@property (nonatomic,assign)int info_type_id;
@property (nonatomic,strong)NSString *info_title;
@property (nonatomic,strong)NSString *info_home_price;
@property (nonatomic,strong)NSString *info_home_address;
@property (nonatomic,strong)NSString *info_home_explain;
@property (nonatomic,strong)NSString *info_imgs;
@property (nonatomic,strong)NSString *info_job_position;
@property (nonatomic,strong)NSString *info_job_salary;
@property (nonatomic,strong)NSString *info_job_requirement;
@property (nonatomic,strong)NSString *info_job_companyname;
@property (nonatomic,strong)NSString *info_job_companyintro;
@property (nonatomic,strong)NSString *info_contact;
@property (nonatomic,strong)NSString *info_tel;
@property (nonatomic,strong)NSString *info_addtime;
@property (nonatomic,strong)NSString *info_edittime;
@property (nonatomic,assign)int info_status;
@property (nonatomic,assign)int info_hits;
@property (nonatomic,assign)int city_id;
@property (nonatomic,strong)NSString *info_job_number;
@property (nonatomic,assign)int info_type_pid;
@property (nonatomic,strong)NSString *info_type_name;
@property (nonatomic,strong)NSArray *info_home_config;
@property (nonatomic,strong)NSArray *info_job_weal;
@property (nonatomic,strong)NSArray *info_job_weal_new;
@property (nonatomic,strong)NSArray *info_imgs_new;
@property (nonatomic,strong)NSString *share_title;
@property (nonatomic,strong)NSString *share_img;
@property (nonatomic,strong)NSString *share_url;
@property (nonatomic,strong)NSString *share_content;

-(void)SetValueforDetailInfo:(NSDictionary *)dic;
@end
