//
//  BuyNowViewController.h
//  HappyBuy
//
//  Created by echo24 on 15/10/8.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsDetail.h"
#import "orlist.h"
@interface BuyNowViewController : UIViewController
@property (nonatomic,strong)GoodsDetail *detail;
@property (nonatomic,assign)int number;
@property (nonatomic,strong)NSArray *listArray;
@end
