//
//  advertise.m
//  HappyBuy568
//
//  Created by echo24 on 15/9/25.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "Store.h"
#import "StoreComment.h"
#import "companyPro.h"
@implementation Store
-(void)setValueDictionary:(NSDictionary *)dic{
    self.company_id = [dic[@"company_id"] intValue];
    self.company_ad = dic[@"company_ad"];
    self.company_ico = dic[@"company_ico"];
    self.company_name = dic[@"company_name"];
    self.company_url = dic[@"company_url"];
    self.company_shortname = dic[@"company_shortname"];
/////////////////////////////////////////9.28添加
    self.user_id = [dic[@"user_id"] integerValue];
    self.company_applytime = dic[@"company_applytime"];
    self.company_throughtime = dic[@"company_throughtime"];
    self.company_type_id = [dic[@"company_type_id"]integerValue];
    self.company_contact = dic[@"company_contact"];
    self.company_address = dic[@"company_address"];
    self.company_tel = dic[@"company_tel"];
    self.company_about = dic[@"company_about"];
    self.company_guide = dic[@"company_guide"];
    self.company_video = dic[@"company_video"];
    self.company_level = [dic[@"company_level"]integerValue];
    self.company_hits = [dic[@"company_hits"]integerValue];
    self.city_id = [dic[@"city_id"]integerValue];
    self.company_isrecommend = [dic[@"company_isrecommend"]integerValue];
    self.company_listorder = [dic[@"company_listorder"]integerValue];
    self.company_iscomment = [dic[@"company_iscomment"]integerValue];
    self.company_card = dic[@"company_card"];
    self.share_url = dic[@"share_url"];
    self.share_title = dic[@"share_title"];
    self.share_img = dic[@"share_img"];
    self.share_content = dic[@"share_content"];
    
    //获取company_pro数组
    NSArray *array = dic[@"company_pro"];
    NSMutableArray *muarr = [NSMutableArray array];
    for (NSDictionary *dic in array) {
//        NSLog(@"dic == %@",dic);
        companyPro *compro = [[companyPro alloc] init];
        [compro SetforcomPro:dic];
        [muarr addObject:compro];
    }
    self.company_pro = muarr;
    
    //获取company_comment数组
    NSArray *array_comment = dic[@"company_comment"];
    NSMutableArray *muarr_comment = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in array_comment) {
        StoreComment *stocom = [[StoreComment alloc] init];
        [stocom SetStorecom:dic];
        [muarr_comment addObject:stocom];
    }
    self.company_comment = muarr_comment;
    
    //获取company_imgs_new数组
    NSArray *array_img = dic[@"company_imgs_new"];
    
    self.company_imgs_new=[NSMutableArray array];
    for (NSDictionary *dic in array_img) {
        NSString *img = dic[@"img"];
        [self.company_imgs_new addObject:img];
    }
    
}

-(void)setValue:(id)value forKey:(NSString *)key{
    
}

@end
