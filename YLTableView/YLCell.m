//
//  YLCell.m
//  YLTableView
//
//  Created by eviloo7 on 16/3/31.
//  Copyright © 2016年 eviloo7. All rights reserved.
//

#import "YLCell.h"
@interface YLCell() {
    UIButton *_btn;
}
@end
@implementation YLCell
//重写就好
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self ==nil) {
        return nil;
    }
    self.contentView.backgroundColor = [UIColor greenColor];
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(10, 10, 200, 30);
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor redColor]];
    [self.contentView addSubview:btn];
    _btn = btn;
    return self;
}
- (void)config:(NSString *)dict{
    [_btn setTitle:dict forState:UIControlStateNormal ];
    
}
- (void)clickBtn:(UIButton*)sender {
    [self.delegate click];
}
@end
