//
//  DateViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/14.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "DateViewController.h"

@interface DateViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIDatePicker *datepic;

@end

@implementation DateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //进入界面是显示用户当前设置的生日
    self.label.text = self.info.user_birthday;
    NSDateFormatter *dateformater= [[NSDateFormatter alloc] init];
    [dateformater setDateFormat:@"yyyy-MM-dd"];
    NSDate *datee = [dateformater dateFromString:self.label.text];
    [self.datepic setDate:datee];
    //添加picker改变时的事件
    [self.datepic addTarget:self action:@selector(changeDate:) forControlEvents:UIControlEventValueChanged];
}
-(void)changeDate:(UIDatePicker *)picker{
    NSDateFormatter *Dateformatter = [[NSDateFormatter alloc] init];
    [Dateformatter setDateFormat:@"yyyy-MM-dd"];
    self.label.text = [Dateformatter stringFromDate:picker.date];
    
}


//确定
- (IBAction)confirm:(UIButton *)sender {
    NSString *birthday = _label.text;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"birthday" object:birthday];
    [self.view removeFromSuperview];
}
//取消
- (IBAction)cancek:(id)sender {
    [self.view removeFromSuperview];
}
//触摸屏幕
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view removeFromSuperview];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
