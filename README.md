# YLTableView
使用block方式封装
tableView的还有很多方法没有封装，待以后有时间都写一遍。
你只需要简单的几句就能实现tableView，不需要设置代理，协议。
##使用
###系统默认的cell
	<code>
		YLTableView *view2 = [[YLTableView alloc] initWithFrame:CGRectMake(0, 220, self.view.bounds.size.width, 200) style:UITableViewStylePlain];
   
    view2.cellHeight = 80;
    view2.dataArray = @[@"默认的cell",@"默认的cell",@"默认cell2",@"默认cell2",@"默认cell2"];
    view2.tableViewCellStyle = UITableViewCellStyleValue1;
    view2.cellHeightBlock = ^(UITableView*tableVewll, NSIndexPath *indexPath){
	//        一定要用小数形式，写整数会报错
        if (indexPath.row %2 ==0) {
            return 50.0;
        }
        return 100.0;
    };
    view2.cellData =  ^(UITableViewCell * cell ,id data,NSIndexPath *indexPath){
	//        绑数据
        cell.imageView.image = [UIImage imageNamed:@"gou"];
        cell.backgroundColor= [UIColor blueColor];
        cell.textLabel.text = data;
    };
    [self.view addSubview:view2];		
	</code>
###自定义cell
	<code>
		YLTableView *view = [[YLTableView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 150) style:UITableViewStylePlain];
	;
    view.dataArray = @[@"自定义的cell",@"自定义的cell",@"自定义cell2",@"自定义cell2",@"自定义cell2"];
    view.cellClassNameArray = @[@"YLCell"];
    view.cellHeight = 100;
    view.cellData =  ^(UITableViewCell * cell ,id data,NSIndexPath *indexPath){
	//        绑数据
        [(YLCell*)cell config:data];
    };
    [self.view addSubview:view];`
	</code>
