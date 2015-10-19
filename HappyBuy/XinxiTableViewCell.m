//
//  XinxiTableViewCell.m
//  HappyBuy
//
//  Created by echo24 on 15/10/10.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "XinxiTableViewCell.h"

@implementation XinxiTableViewCell

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
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 100, 90)];
    imgView.tag = 80;
    [self.contentView addSubview:imgView];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(132, 8, 227, 21)];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(132, 39, 227, 21)];
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(132, 71, 132, 21)];
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(270, 71, 97, 21)];
    label1.font = [UIFont systemFontOfSize:15];
    label2.font = [UIFont systemFontOfSize:14];
    label3.font = [UIFont systemFontOfSize:16];
    label4.font = [UIFont systemFontOfSize:14];
    label1.tag = 81;
    label2.tag = 82;
    label3.tag = 83;
    label4.tag = 83;
    [self.contentView addSubview:label1];
    [self.contentView addSubview:label2];
    [self.contentView addSubview:label3];
    [self.contentView addSubview:label4];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
