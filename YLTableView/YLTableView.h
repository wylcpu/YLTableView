//
//  YLTableView.h
//  YLTableView
//
//  Created by eviloo7 on 16/3/30.
//  Copyright © 2016年 eviloo7. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLTableView : UITableView
/**
 *  数据，可以是一维数组，二维数组
 */
@property (nonatomic,copy)NSArray *dataArray;
/**
 *  设置Identifier
 */
@property (nonatomic,copy)NSArray<NSString*> *cellIdentifierArray;
/**
 *  设置header固定高
 */
@property (nonatomic,assign) CGFloat headerHeight;
/**
 *  设置cell固定高
 */
@property (nonatomic,assign) CGFloat cellHeight;
/**
 *  设置footer固定高
 */
@property(nonatomic,assign) CGFloat footerHeight;




/**
 *  设置footer高
 */
@property (nonatomic,copy)CGFloat (^footerHeightBlock)(UITableView *tableView,NSInteger section);
/**
 *  设置header的高
 */
@property (nonatomic,copy)CGFloat (^headerHeightBlock)(UITableView *tableView,NSInteger section);
/**
 *  设置cell的高
 */
@property (nonatomic,copy) CGFloat(^cellHeightBlock)(UITableView *tableView,NSIndexPath *indexPath);
/**
 *  点击
 */
@property (nonatomic,copy) void(^didSelectCell)(UITableView *tableView,NSIndexPath  *indexPath);
/**
 *  指定使用的cell
 */
@property (nonatomic,copy) NSString *(^cellIdentifierBlock)(NSIndexPath*indexPath);
/**
 *  数据填充
 */
@property (nonatomic,copy) void(^cellData)(UITableViewCell* cell,id data,NSIndexPath *indexPath);
@end
