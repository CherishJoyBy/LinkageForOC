//
//  BYTableViewController.m
//  LinkageForOC
//
//  Created by lby on 2017/4/12.
//  Copyright © 2017年 lby. All rights reserved.
//

#import "BYTableViewController.h"
#import "BYCategoryModel.h"
#import "BYFoodModel.h"
#import "BYLeftTableViewCell.h"
#import "BYRightTableViewCell.h"
#import "BYTableViewHeaderView.h"

@interface BYTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *categoryData;
@property (nonatomic, strong) NSMutableArray *foodData;
@property (nonatomic, weak) UITableView *leftTableView;
@property (nonatomic, weak) UITableView *rightTableView;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, assign) BOOL isScrollDown;

@end

@implementation BYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.selectIndex = 0;
    self.isScrollDown = YES;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"meituan" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *foods = dict[@"data"][@"food_spu_tags"];
    
    for (NSDictionary *dict in foods)
    {
        BYCategoryModel *model = [BYCategoryModel objectWithDictionary:dict];
        [self.categoryData addObject:model];
        
        NSMutableArray *datas = [NSMutableArray array];
        for (BYFoodModel *f_model in model.spus)
        {
            [datas addObject:f_model];
        }
        [self.foodData addObject:datas];
    }
    
    self.leftTableView.tableFooterView = [[UIView alloc] init];
    
//    [self.view addSubview:self.leftTableView];
//    [self.view addSubview:self.rightTableView];
    
    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.leftTableView == tableView)
    {
        return 1;
    }
    else
    {
        return  self.categoryData.count;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.leftTableView == tableView)
    {
        // self.categoryData中含有13个数组,每个数组中有两个字段和一个spus字典,spus字典中的值为数组,该数组即为rightTableView的cell
        return self.categoryData.count;
    }
    else
    {
        // self.foodData中含有13个数组,每个数组中对应rightTableView中的cell
        return [self.foodData[section] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.leftTableView == tableView)
    {
        BYLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_Left forIndexPath:indexPath];
        //
        BYCategoryModel *model = self.categoryData[indexPath.row];
        cell.name.text = model.name;
        return cell;
    }
    else
    {
        BYRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_Right forIndexPath:indexPath];
        BYFoodModel *model = self.foodData[indexPath.section][indexPath.row];
        cell.model = model;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (self.rightTableView == tableView)
    {
        return 20;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (self.rightTableView == tableView)
    {
        BYTableViewHeaderView * headerView = [[BYTableViewHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
        BYFoodModel *model = self.categoryData[section];
        headerView.name.text = model.name;
        return headerView;
    }
    return nil;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(nonnull UIView *)view forSection:(NSInteger)section
{
    // 当前的tableView是RightTableView，RightTableView滚动的方向向上，RightTableView是用户拖拽而产生滚动的（（主要判断RightTableView用户拖拽而滚动的，还是点击LeftTableView而滚动的）
    if ((self.rightTableView == tableView) && !self.isScrollDown && self.rightTableView.dragging)
    {
        [self selectRowAtIndexPath:section];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // 当前的tableView是RightTableView，RightTableView滚动的方向向下，RightTableView是用户拖拽而产生滚动的（（主要判断RightTableView用户拖拽而滚动的，还是点击LeftTableView而滚动的）
    if ((self.rightTableView == tableView) && self.isScrollDown && self.rightTableView.dragging)
    {
        [self selectRowAtIndexPath:section + 1];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (self.leftTableView == tableView)
    {
        self.selectIndex = indexPath.row;
        [self.rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.selectIndex] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        [self.leftTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.selectIndex inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

// 当拖动右边TableView的时候，处理左边TableView
- (void)selectRowAtIndexPath:(NSInteger)index
{
    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static CGFloat lastOffsetY = 0;
    
    UITableView *tableView = (UITableView *)scrollView;
    if (self.rightTableView == tableView)
    {
        // 用户向上滑动,scrollView.contentOffset.y的值逐渐增加,self.isScrollDown = YES
//        NSLog(@"%@",NSStringFromCGPoint( scrollView.contentOffset));
        self.isScrollDown = lastOffsetY < scrollView.contentOffset.y;
        lastOffsetY = scrollView.contentOffset.y;
    }
}

#pragma mark - Lazy Load

- (NSMutableArray *)categoryData
{
    if (!_categoryData)
    {
        _categoryData = [NSMutableArray array];
    }
    return _categoryData;
}

- (NSMutableArray *)foodData
{
    if (!_foodData)
    {
        _foodData = [NSMutableArray array];
    }
    return _foodData;
}

- (UITableView *)leftTableView
{
    if (!_leftTableView)
    {
        UITableView *leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 80, SCREEN_HEIGHT)];
        [self.view addSubview:leftTableView];
        
        leftTableView.delegate = self;
        leftTableView.dataSource = self;
        leftTableView.rowHeight = 55;
        leftTableView.showsVerticalScrollIndicator = NO;
        leftTableView.separatorColor = [UIColor clearColor];
        [leftTableView registerClass:[BYLeftTableViewCell class] forCellReuseIdentifier:kCellIdentifier_Left];
        
        _leftTableView = leftTableView;
    }
    return _leftTableView;
}

- (UITableView *)rightTableView
{
    if (!_rightTableView)
    {
        UITableView *rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(80, 64, SCREEN_WIDTH - 80, SCREEN_HEIGHT - 64)];
        [self.view addSubview:rightTableView];
        
        rightTableView.delegate = self;
        rightTableView.dataSource = self;
        rightTableView.rowHeight = 80;
        rightTableView.showsVerticalScrollIndicator = NO;
        [rightTableView registerClass:[BYRightTableViewCell class] forCellReuseIdentifier:kCellIdentifier_Right];
        
        _rightTableView = rightTableView;
    }
    return _rightTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
