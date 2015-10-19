//
//  UserTool.m
//  HappyBuy
//
//  Created by echo24 on 15/10/6.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "UserTool.h"
#import "RequestMethod.h"
#import "UserInfo.h"
#import "orlist.h"
#import "GoodsDetail.h"
#import "Detail_Info.h"

@implementation UserTool
//发表评论
-(void)SendComment:(NSString *)content Uid:(int)userid comid:(int)comid success:(void(^)(NSString *result))success{
    NSString *url = @"index.php/Home/API/add_comment";
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    NSMutableDictionary *pardic = [[NSMutableDictionary alloc] init];
    [pardic setValue:content forKey:@"comment_content"];
    [pardic setValue:[NSString stringWithFormat:@"%d",userid] forKey:@"user_id"];
    [pardic setValue:[NSString stringWithFormat:@"%d",comid] forKey:@"company_id"];
    [RequestMethod PostFileWith:pardic URL:URLadd success:^(id data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        success(@"评论成功!");
    } failure:^(NSError *err) {
        NSLog(@"评论失败");
    }];
}
//举报卖家
-(void)ReportCompany:(NSString *)report_content Uid:(int)user_id comid:(int)company_id success:(void(^)(NSString *result))success{
    NSString *url = @"index.php/Home/API/add_report";
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    NSMutableDictionary *paramdic = [[NSMutableDictionary alloc] init];
    [paramdic setValue:report_content forKey:@"report_content"];
    [paramdic setValue:[NSString stringWithFormat:@"%d",user_id] forKey:@"user_id"];
    [paramdic setValue:[NSString stringWithFormat:@"%d",company_id] forKey:@"company_id"];
    [RequestMethod PostFileWith:paramdic URL:URLadd success:^(id data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dic ==-== %@",dic);
        success(@"举报成功");
    } failure:^(NSError *err) {
        NSLog(@"举报失败");
    }];
}
//添加收藏
-(void)AddCollect:(int)goodid userid:(int)uid success:(void(^)(NSString *content,BOOL status))sucess{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIuser/add_collect/goods_id/%d/user_id/%d",goodid,uid];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        NSString *content = dic[@"content"];
        BOOL status = dic[@"status"];
        sucess(content,status);
    } failure:^(NSError *err) {
        NSLog(@"error == %@",err);
    }];
}
//加入购物车
-(void)AddBuyCar:(int)goodid userid:(int)uid goodnumber:(int)number success:(void(^)(NSString *content))sucess{
    NSString *url = [NSString stringWithFormat:@"Home/APIgoods/addcart/goods_id/%d/goods_number/%d/user_id/%d",goodid,number,uid];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSString *staus = [[NSString alloc]initWithData:su encoding:NSUTF8StringEncoding];
        sucess(staus);
        NSLog(@"%@",staus);
    } failure:^(NSError *err) {
        NSLog(@"error == %@",err);
    }];
}
//修改用户信息
-(void)Userid:(int)uid username:(NSString *)uname uqq:(NSString *)qq umail:(NSString *)u_mail u_phone:(NSString *)uphopne u_adress:(NSString *)address u_phone2:(NSString *)phone2 u_address2:(NSString *)address2 u_sex:(NSString *)sex u_birthday:(NSString *)birthday success:(void(^)(UserLogin *content))success{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIuser/updateinfo/user_id/%d/user_name/%@/user_qq/%@/user_mail/%@/user_phone/%@/user_address/%@/user_phone2/%@/user_address2/%@/user_sex/%@/user_birthday/%@",uid,uname,qq,u_mail,uphopne,address,phone2,address2,sex,birthday];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    
    [RequestMethod getLoadFileWith:nil URL:[URLadd stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] succes:^(id su) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        UserLogin *ulogin = [[UserLogin alloc] init];
        [ulogin SetValueForLogin:dic];
        success(ulogin);
    } failure:^(NSError *err) {
        NSLog(@"error == %@",err);
    }];
}
//修改密码
-(void)Userid:(int)userid oldpass:(NSString *)oldpassword newpass:(NSString *)newspassword newpass1:(NSString *)newpass1 success:(void(^)(UserLogin *content))suecss{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIuser/updatepass/user_id/%d/oldpass/%@/newpass/%@/newpass2/%@/",userid,oldpassword,newspassword,newpass1];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        UserLogin *login = [[UserLogin alloc] init];
        [login SetValueForLogin:dic];
        suecss(login);
    } failure:^(NSError *err) {
        NSLog(@"***修改失败***");
    }];

}
//获取订单信息
-(void)getoederimgs:(int)uid success:(void(^)(NSArray *arr))sucess{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIuser/listorder/user_id/%d",uid];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSDictionary *Array = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *muarr = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in Array) {
            myOrder *odetail = [[myOrder alloc] init];
            [odetail setvalueformyorder:dic];
            [muarr addObject:odetail];
        }
        sucess(muarr);
    } failure:^(NSError *err) {
        NSLog(@"error == %@",err);
    }];
}
//获取订单详细信息
-(void)getdetailmess:(NSString *)snid suceess:(void(^)(myOrder *myder))sucess{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIuser/infoorder/order_sn/%@",snid];
     NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        myOrder *myoder = [[myOrder alloc] init];
        [myoder setvalueformyorder:dic];
        sucess(myoder);
    } failure:^(NSError *err) {
        NSLog(@"error == %@",err);
    }];
}
//取消订单
-(void)cancelorder:(NSString *)order_sn sucess:(void(^)(NSString *cancel))sucess{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIuser/cancelorder/order_sn/%@",order_sn];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        sucess(@"订单取消成功");
    } failure:^(NSError *err) {
        NSLog(@"订单取消失败");
    }];
}
//购物车信息
-(void)buycarcenter:(int)uid sucess:(void(^)(NSArray *array))sucess{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIgoods/listcart/user_id/%d",uid];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *muArray = [NSMutableArray array];
        for (NSDictionary *dic in arr) {
            orlist *list = [[orlist alloc] init];
            [list setvalueforlist:dic];
            [muArray addObject:list];
        }
        sucess(muArray);
    } failure:^(NSError *err) {
        NSLog(@"error == %@",err);
    }];
}
//修改购物车商品数量
-(void)UpdataBuycar:(int)goodid goodnumber:(NSString *)number userid:(int)uid sucess:(void(^)(NSString *result))sucess{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIgoods/updatecartgoods/goods_id/%d/goods_number/%@/user_id/%d",goodid,number,uid];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        sucess(@"修改成功");
    } failure:^(NSError *err) {
        NSLog(@"修改失败");
    }];
}
//删除某件商品
-(void)deleteGoods:(int)goodid userid:(int)uid sucess:(void(^)(NSString *result))sucess{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIgoods/deletecartgoods/goods_id/%d/user_id/%d",goodid,uid];
     NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        sucess(@"删除成功");
    } failure:^(NSError *err) {
        NSLog(@"删除失败");
    }];
}
//提交订单
-(void)Submit:(NSString *)order_consignee address:(NSString *)order_address tel:(NSString *)order_tel remarks:(NSString *)order_remarks uid:(int)user_id payid:(int)order_pay_id delivery:(int)order_delivery gid:(NSString *)goods_id sucess:(void(^)(NSString *result))sucess{
    NSMutableDictionary *mudic = [[NSMutableDictionary alloc] init];
    [mudic setValue:order_consignee forKey:@"order_consignee"];
    [mudic setValue:order_address forKey:@"order_address"];
    [mudic setValue:order_tel forKey:@"order_tel"];
    [mudic setValue:order_remarks forKey:@"order_remarks"];
    [mudic setValue:[NSString stringWithFormat:@"%d",user_id] forKey:@"user_id"];
    [mudic setValue:[NSString stringWithFormat:@"%d",order_pay_id] forKey:@"order_pay_id"];
    [mudic setValue:[NSString stringWithFormat:@"%d",order_delivery] forKey:@"order_delivery"];
    [mudic setValue:goods_id forKey:@"goods_id"];
    NSString *json = [LZXHelper DataTOjsonString:mudic];
    NSString *url = @"http://www.lg568.com/index.php/Home/APIgoods/addorder";
    [RequestMethod PostFileWith:@{@"orderInfo":json} URL:url success:^(id data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",dic[@"content"]);
        sucess(dic[@"order_sn"]);
    } failure:^(NSError *err) {
        NSLog(@"提交失败");
    }];
}
//我的收藏
-(void)usid:(int)uid sucess:(void(^)(NSArray *collect))sucess{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIuser/list_collect/user_id/%d",uid];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSArray *array = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *Muarray = [[NSMutableArray alloc] init];
        for (NSDictionary *dic in array) {
            GoodsDetail *gdetail = [[GoodsDetail alloc] init];
            [gdetail setValueForGoodsDe:dic];
            [Muarray addObject:gdetail];
        }
        sucess(Muarray);
    } failure:^(NSError *err) {
        NSLog(@"获取失败");
    }];
}
//取消收藏
-(void)CollectCancle:(int)collectID sucess:(void(^)(NSString *result))sucess{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIuser/cancle_collect/collect_id/%d",collectID];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        sucess(dic[@"content"]);
        NSLog(@"%@",dic[@"content"]);
    } failure:^(NSError *err) {
        NSLog(@"请求失败");
    }];
}
//发布信息列表
-(void)Information:(int)uid sucess:(void(^)(NSArray *collect))sucess{
    NSString *url = [NSString stringWithFormat:@"index.php/Home/APIuser/list_myinfo/user_id/%d",uid];
    NSString *URLadd = [NSString stringWithFormat:@"%@/%@",ServerWeb,url];
    [RequestMethod getLoadFileWith:nil URL:URLadd succes:^(id su) {
        NSArray *Arr = [NSJSONSerialization JSONObjectWithData:su options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *Muarray = [NSMutableArray array];
        for (NSDictionary *dic in Arr) {
            Detail_Info *detainfo = [[Detail_Info alloc] init];
            [detainfo SetValueforDetailInfo:dic];
            [Muarray addObject:detainfo];
        }
        sucess(Muarray);
    } failure:^(NSError *err) {
        NSLog(@"请求失败");
    }];
}

@end
