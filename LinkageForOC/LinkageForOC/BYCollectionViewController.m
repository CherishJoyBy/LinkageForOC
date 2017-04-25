//
//  BYCollectionViewController.m
//  LinkageForOC
//
//  Created by lby on 2017/4/17.
//  Copyright © 2017年 lby. All rights reserved.
//

#import "BYCollectionViewController.h"

@interface BYCollectionViewController ()<UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableArray *collectionDatas;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, assign) BOOL isScrollDown;

@end

@implementation BYCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - collectionViewDelegate

@end
