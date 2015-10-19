//
//  TabbarViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/9/25.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "TabbarViewController.h"
#import "StoreServer.h"
#import "Store.h"

@interface TabbarViewController ()
@property (nonatomic,strong)UIImageView *uiimage;

@end

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self AddpicFromNet];
}
-(void)AddpicFromNet{
    _uiimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
    [self.view addSubview:_uiimage];
    StoreServer *stsv = [[StoreServer alloc] init];
    [stsv getADStoreObject:2 success:^(Store *store) {
        NSString *url = [NSString stringWithFormat:@"%@%@",ServerWeb,store.company_ad];
        [_uiimage sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"w1.jpg"]];
    }];
    __weak typeof(self) MySelf = self;
    //设置一个延迟时间为2秒的线程
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        //2.5秒后执行动画
        [UIView animateWithDuration:0.4 animations:^{
            //动画的内容是将imageV的中心由（375/2.0, 667.0/2.0）移动到(-375/2.0, 667.0/2.0)
            MySelf.uiimage.center = CGPointMake(-375/2.0, 667.0/2.0);
        } completion:^(BOOL finished) {
            //当动画完成时，将imageV从父视图上移除
            [MySelf.uiimage removeFromSuperview];
        }];
    });
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
