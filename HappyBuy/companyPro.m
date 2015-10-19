//
//  companyPro.m
//  HappyBuy
//
//  Created by echo24 on 15/9/28.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "companyPro.h"

@implementation companyPro

-(void)SetforcomPro:(NSDictionary *)dic{
    self.company_pro_id = [dic[@"company_pro_id"] integerValue];
    self.company_pro_imgsrc = dic[@"company_pro_imgsrc"];
    self.company_pro_title = dic[@"company_pro_title"];
    self.company_pro_content = dic[@"company_pro_content"];
    self.company_pro_remarks = dic[@"company_pro_remarks"];
    self.company_id = [dic[@"company_id"] integerValue];
    self.company_pro_listorder = [dic[@"company_pro_listorder"] integerValue];
}
@end
