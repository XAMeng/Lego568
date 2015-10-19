//
//  TypeView.m
//  HappyBuy
//
//  Created by echo24 on 15/10/10.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "TypeView.h"
#import "XinxiTableViewCell.h"

@interface TypeView ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation TypeView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//加载滚动视图(button)
-(void)AddScrollerView{
    UIScrollView *ScroView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, Width, 50)];
    ScroView.showsHorizontalScrollIndicator = NO;
    ScroView.showsVerticalScrollIndicator = NO;
    [ScroView setContentSize:CGSizeMake(80*self.array.count, 50)];
    ScroView.delegate = self;
    for (int i; i < self.array.count; i ++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(80*i, 0, 80, 50);
        [button setTitle:self.array[i] forState:UIControlStateNormal];
        [ScroView addSubview:button];
        button.tag = 50+i;
    }
    [self.view addSubview:ScroView];
}   
//加载滚动视图(TableView)
-(void)AddTableview{
    UIScrollView *ScroView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 114, Width, Height - 114)];
    ScroView.pagingEnabled = YES;
    ScroView.showsHorizontalScrollIndicator = NO;
    ScroView.showsVerticalScrollIndicator = NO;
    [ScroView setContentSize:CGSizeMake(80*self.array.count, 50)];
    ScroView.delegate = self;
    for (int i; i < self.array.count; i ++) {
        UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScroView.bounds.size.width, ScroView.bounds.size.width) style:UITableViewStylePlain];
        tableview.tag = 100+i;
        tableview.delegate = self;
        tableview.dataSource = self;
        [ScroView addSubview:tableview];
    }
}


#pragma tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XinxiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[XinxiTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    UIImageView *imgView = (UIImageView *)[cell viewWithTag:80];
    return cell;
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
