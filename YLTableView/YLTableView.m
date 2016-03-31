//
//  YLTableView.m
//  YLTableView
//
//  Created by eviloo7 on 16/3/30.
//  Copyright © 2016年 eviloo7. All rights reserved.
//

#import "YLTableView.h"
@interface YLTableView ()<UITableViewDelegate,UITableViewDataSource> {
    BOOL _isTwoDimensional;
}
@end
@implementation YLTableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (!self) {
        return nil;
    }
    self.dataSource = self;
    self.delegate = self;
//    消掉多余下划线
    self.tableFooterView = [UIView new];
    return self;
}
-(void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
//    判读维度，一维数组？二维数组
    if ([_dataArray[0] isKindOfClass:[NSArray class]]) {
        _isTwoDimensional = YES;
    } else {
        _isTwoDimensional = NO;
    }
    [self reloadData];
}
- (void)setCellIdentifierArray:(NSArray<NSString *> *)cellIdentifierArray {
    _cellIdentifierArray = cellIdentifierArray;
//    注册cell
    for (NSString* className in cellIdentifierArray) {
        [self registerClass:NSClassFromString(className) forCellReuseIdentifier:className];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.headerHeight > 0) {
        return self.headerHeight;
    } else if (self.headerHeightBlock) {
        return self.headerHeightBlock(tableView,section);
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.footerHeight>0) {
        return self.footerHeight;
    } else if (self.footerHeightBlock) {
        return self.footerHeightBlock(tableView,section);
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_isTwoDimensional) {
        return _dataArray.count;
    } else {
        return 1;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.cellHeight > 0) {
        return self.cellHeight;
    } else if (self.cellHeightBlock) {
        return self.cellHeightBlock(tableView,indexPath);
    }
    return 70;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_isTwoDimensional) {
        return [_dataArray[section] count];
    } else {
        return _dataArray.count;
    }
    return 0;
}
- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
  static  NSString *identifier = nil;
    if (self.cellIdentifierBlock) {
        identifier = self.cellIdentifierBlock(indexPath);
    } else {
        if (indexPath.section < self.cellIdentifierArray.count) {
            identifier = self.cellIdentifierArray[section];
        }
        
    }
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (self.cellData) {
        if (_isTwoDimensional) {
            self.cellData(cell,self.dataArray[indexPath.section][indexPath.row],indexPath);
        } else {
            self.cellData(cell,self.dataArray[indexPath.row],indexPath);
        }
        
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectCell) {
        self.didSelectCell(tableView,indexPath);
    }
}
@end
