//
//  YLCell.m
//  YLTableView
//
//  Created by eviloo7 on 16/3/31.
//  Copyright © 2016年 eviloo7. All rights reserved.
//

#import "YLCell.h"

@implementation YLCell
- (void)config:(NSDictionary *)dict{
    self.textLabel.text = dict[@"kk"];
    self.contentView.backgroundColor = [UIColor greenColor];
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(10, 10, 70, 30);
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor blueColor]];
    [self.contentView addSubview:btn];
}
- (void)clickBtn:(UIButton*)sender {
    [self.delegate click];
}
@end
