//
//  ViewController.m
//  LinkageForOC
//
//  Created by lby on 2017/4/12.
//  Copyright © 2017年 lby. All rights reserved.
//

#import "ViewController.h"
#import "BYTableViewController.h"
#import "BYCollectionViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = @[@"UITableView",@"UICollectionView"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0)
    {
        BYTableViewController *table = [[BYTableViewController alloc] init];
        table.title = self.datas[indexPath.row];
        [self.navigationController pushViewController:table animated:YES];
    }
    else
    {
        BYCollectionViewController *collection = [[BYCollectionViewController alloc] init];
        collection.title = self.datas[indexPath.row];
        [self.navigationController pushViewController:collection animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
