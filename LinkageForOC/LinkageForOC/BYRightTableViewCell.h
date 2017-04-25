//
//  RightTableViewCell.h
//  LinkageForOC
//
//  Created by lby on 2017/4/13.
//  Copyright © 2017年 lby. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BYFoodModel;

#define kCellIdentifier_Right @"RightTableViewCell"

@interface BYRightTableViewCell : UITableViewCell

@property (nonatomic, strong) BYFoodModel *model;

@end
