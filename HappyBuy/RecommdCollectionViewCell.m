//
//  RecommdCollectionViewCell.m
//  HappyBuy
//
//  Created by echo24 on 15/9/26.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "RecommdCollectionViewCell.h"

@implementation RecommdCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addcontent];
    }
    return self;
}
-(void)addcontent{
    UIImageView *imgv = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 20, 20)];
    [self.contentView addSubview:imgv];
    imgv.tag = 21;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30, 5, 85, 20)];
    label.tintColor = [UIColor blackColor];
    label.tag = 20;
//    label.font = [UIFont systemFontOfSize:10.0];
    [self.contentView addSubview:label];
}
@end
