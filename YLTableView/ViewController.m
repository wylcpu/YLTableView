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
    for (int i=0; i<500; i++) {
        [arr addObject:@{@"jj":@"111111"}];
    }
//    view.noResultView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"liqin_1.jpg"]];
    view.dataArray = arr;
    view.cellData =  ^(UITableViewCell * cell ,id data,NSIndexPath *indexPath){
          cell.textLabel.text = @"dsfasfdafhdish";
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
