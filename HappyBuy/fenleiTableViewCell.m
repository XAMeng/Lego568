//
//  fenleiTableViewCell.m
//  HappyBuy
//
//  Created by echo24 on 15/10/8.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "fenleiTableViewCell.h"

@implementation fenleiTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addcontent];
    }
    return self;
}

-(void)addcontent{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 90, 20)];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:13];
    label.tag = 30;
    [self.contentView addSubview:label];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
