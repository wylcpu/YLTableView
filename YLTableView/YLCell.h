//
//  YLCell.h
//  YLTableView
//
//  Created by eviloo7 on 16/3/31.
//  Copyright © 2016年 eviloo7. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol YLCellDelegate
-(void)click;
@end
@interface YLCell : UITableViewCell
- (void)config:(NSDictionary *)dict;
@property(nonatomic,weak)id delegate;
@end
