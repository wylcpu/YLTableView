//
//  ViewController.m
//  YLTableView
//
//  Created by eviloo7 on 16/3/30.
//  Copyright © 2016年 eviloo7. All rights reserved.
//

#import "ViewController.h"
#import "YLTableView.h"
#import "YLCell.h"
#import "YLCell2.h"
@interface ViewController ()<YLCellDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YLTableView *view = [[YLTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i=0; i<10000; i++) {
        
            [arr addObject:@{@"jj":@"111111"}];
        
    }
    view.dataArray = arr;
    view.cellIdentifierArray = @[@"YLCell",@"YLCell2"];
    view.cellIdentifierBlock = ^(NSIndexPath *indexPath){
        return @"YLCell2";
    };
    view.cellHeightBlock = ^(UITableView *tanl,NSIndexPath *index) {
        if (index.section == 0) {
            return 200.0;
        }
        return 70.0;
    };
    __weak typeof(self)weakSelf = self;
      view.cellData =  ^(UITableViewCell * cell ,id data,NSIndexPath *indexPath){
      
            YLCell2 *cell2 = (YLCell2*)cell;
            [cell2 config:data];
        
    };
    [self.view addSubview:view];
}
- (void)click{
    NSLog(@"点击了我");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
