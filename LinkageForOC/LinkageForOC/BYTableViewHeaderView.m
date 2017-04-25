//
//  BYTableViewHeaderView.m
//  LinkageForOC
//
//  Created by lby on 2017/4/17.
//  Copyright © 2017年 lby. All rights reserved.
//

#import "BYTableViewHeaderView.h"

@implementation BYTableViewHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = rgba(240, 240, 240, 0.8);
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 20)];
        nameLabel.font =[UIFont systemFontOfSize:13];
        [self addSubview:nameLabel];
        self.name = nameLabel;
    }
    return self;
}

@end
