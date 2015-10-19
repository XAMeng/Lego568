//
//  EditGoodsNumViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/15.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "EditGoodsNumViewController.h"
#import "UserTool.h"

@interface EditGoodsNumViewController ()
@property (weak, nonatomic) IBOutlet UILabel *goodsnum;
@property (nonatomic,assign)int num;

@end

@implementation EditGoodsNumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _num = [_list.goods_number intValue];
    _goodsnum.text = self.list.goods_number;
}
//增加
- (IBAction)downbtn:(id)sender {
   
    _num--;
    _goodsnum.text = [NSString stringWithFormat:@"%d",_num];
}
//减少
- (IBAction)upbtn:(id)sender {
    _num++;
    _goodsnum.text = [NSString stringWithFormat:@"%d",_num];
}
//确定
- (IBAction)confirm:(id)sender {
    _list.goods_number =[NSString stringWithFormat:@"%d",_num];
    UserTool *tool = [[UserTool alloc] init];
    [tool UpdataBuycar:self.list.goods_id goodnumber:_list.goods_number userid:_list.user_id sucess:^(NSString *result) {
        NSLog(@"%@",result);
        [self.view removeFromSuperview];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"goodnumber" object:_list];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
