//
//  BYCollectionViewHeaderView.m
//  LinkageForOC
//
//  Created by lby on 2017/4/17.
//  Copyright © 2017年 lby. All rights reserved.
//

#import "BYCollectionViewHeaderView.h"

@implementation BYCollectionViewHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = rgba(240, 240, 240, 0.8);
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, SCREEN_WIDTH - 80, 20)];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLabel];
        self.title = titleLabel;
    }
    return self;
}

@end
