//
//  LeftTableViewCell.m
//  LinkageForOC
//
//  Created by lby on 2017/4/13.
//  Copyright © 2017年 lby. All rights reserved.
//

#import "BYLeftTableViewCell.h"

#define defaultColor rgba(253, 212, 49, 1)

@interface BYLeftTableViewCell ()

@property (nonatomic, weak) UIView *yellowView;

@end

@implementation BYLeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 60, 40)];
        [self.contentView addSubview:nameLabel];
        nameLabel.numberOfLines = 0;
        nameLabel.font = [UIFont systemFontOfSize:15];
        nameLabel.textColor = rgba(130, 130, 130, 1);
        nameLabel.highlightedTextColor = defaultColor;
        self.name = nameLabel;
        
        UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, 5, 45)];
        [self.contentView addSubview:yellowView];
        yellowView.backgroundColor = defaultColor;
        self.yellowView = yellowView;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.contentView.backgroundColor = selected ? [UIColor whiteColor] : [UIColor colorWithWhite:0 alpha:0.1];
    self.highlighted = selected;
    self.name.highlighted = selected;
    self.yellowView.hidden = !selected;
}

@end
