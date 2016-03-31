//
//  YLCell2.m
//  YLTableView
//
//  Created by eviloo7 on 16/3/31.
//  Copyright © 2016年 eviloo7. All rights reserved.
//

#import "YLCell2.h"

@implementation YLCell2
- (void)config:(NSDictionary *)dict{
    self.textLabel.text = dict[@"jj"];
//    self.backgroundColor = [UIColor greenColor];
    self.contentView.backgroundColor = [UIColor redColor];
}
@end
