//
//  SEXViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/14.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "SEXViewController.h"

@interface SEXViewController ()
@property (weak, nonatomic) IBOutlet UIView *backview;

@end

@implementation SEXViewController

-(void)viewWillAppear:(BOOL)animated{
    _backview.layer.masksToBounds = YES;
    _backview.layer.cornerRadius = 10.0;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}
- (IBAction)btnClick:(UIButton *)sender {
    NSString *sex = sender.titleLabel.text;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"setsex" object:sex userInfo:nil];
    [self.view removeFromSuperview];
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
