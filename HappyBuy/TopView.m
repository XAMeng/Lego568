//
//  TopView.m
//  HappyBuy
//
//  Created by echo24 on 15/9/26.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "TopView.h"

@implementation TopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addcontent];
    }
    return self;
}
-(void)addcontent{
    self.backgroundColor = [UIColor blackColor];
    self.alpha = 0.3;
}
@end
