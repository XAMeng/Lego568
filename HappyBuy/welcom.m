//
//  welcom.m
//  HappyBuy568
//
//  Created by echo24 on 15/9/25.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "welcom.h"

@interface welcom ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scrview;
@property (nonatomic,strong)UIPageControl *pageindex;
@property (nonatomic,strong)NSArray *array;
@end

@implementation welcom

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _array = @[@"w2.jpg",@"w3.jpg",@"w4.jpg"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addsrcview];
}
-(void)addsrcview{
    _scrview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
    _pageindex = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 600, Width, 20)];
    _pageindex.numberOfPages = 3;
    [_pageindex addTarget:self action:@selector(pageclick:) forControlEvents:UIControlEventValueChanged];
    _scrview.contentSize = CGSizeMake(Width*_array.count, Height);
    _scrview.pagingEnabled = YES;
    _scrview.showsVerticalScrollIndicator = NO;
    _scrview.showsHorizontalScrollIndicator = NO;
    _scrview.delegate = self;
    [self.view addSubview:_scrview];
    for (int i=0;i <_array.count;i++) {
        UIImageView *blackView = [[UIImageView alloc] initWithFrame:CGRectMake(i*Width, 0, Width, Height)];
        blackView.tag = i+10;
        blackView.userInteractionEnabled = YES;
        NSString *iname = _array[i];
        blackView.image = [UIImage imageNamed:iname];
        [_scrview addSubview:blackView];
    }
    //添加一个button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(Width*_array.count-253, Height-120, 120, 40);
    [button setBackgroundImage:[UIImage imageNamed:@"scr_button_jr.png"] forState:UIControlStateNormal];
    [_scrview addSubview:button];
    
    [self.view addSubview:_pageindex];

}
#pragma ScrowView代理
//ScrowView结束滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int index = scrollView.contentOffset.x/scrollView.frame.size.width;
    _pageindex.currentPage = index;
}
-(void)pageclick:(UIPageControl *)page{
    [_scrview setContentOffset:CGPointMake(_scrview.frame.size.width*_pageindex.currentPage, 0) animated:YES];
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
