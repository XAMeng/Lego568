//
//  AllCommentViewController.m
//  HappyBuy
//
//  Created by echo24 on 15/10/5.
//  Copyright (c) 2015年 Echo24. All rights reserved.
//

#import "AllCommentViewController.h"
#import "Store.h"
#import "StoreComment.h"
@interface AllCommentViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tabview;
@property (nonatomic,strong)Store *sto;
@end

@implementation AllCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    StoreServer *stoser = [[StoreServer alloc] init];
    [stoser getStoreDetail:2 companyID:self.stoid sucess:^(Store *store) {
        self.sto = store;
        [_tabview reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *commentArray = self.sto.company_comment;
    return commentArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *commentArray = self.sto.company_comment;
    StoreComment *comment = commentArray[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *labelid = (UILabel *)[cell viewWithTag:20];
    UILabel *labelcontent = (UILabel *)[cell viewWithTag:22];
    UILabel *labelDate = (UILabel *)[cell viewWithTag:21];
    labelid.text = comment.user_name;
    labelDate.text = comment.comment_addtime;
    labelcontent.text = comment.comment_content;
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
