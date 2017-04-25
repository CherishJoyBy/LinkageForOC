//
//  RightTableViewCell.m
//  LinkageForOC
//
//  Created by lby on 2017/4/13.
//  Copyright © 2017年 lby. All rights reserved.
//

#import "BYRightTableViewCell.h"
#import "BYFoodModel.h"

@interface BYRightTableViewCell ()

@property (nonatomic, weak) UIImageView *imageV;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *priceLabel;

@end

@implementation BYRightTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
        [self.contentView addSubview:imageV];
        self.imageV = imageV;
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 200, 30)];
        [self.contentView addSubview:nameLabel];
        nameLabel.font = [UIFont systemFontOfSize:14];
        self.nameLabel = nameLabel;
        
        UILabel *priceLabel= [[UILabel alloc] initWithFrame:CGRectMake(80, 45, 200, 30)];
        [self.contentView addSubview:priceLabel];
        priceLabel.font = [UIFont systemFontOfSize:14];
        priceLabel.textColor = [UIColor redColor];
        self.priceLabel = priceLabel;
    }
    return self;
}

- (void)setModel:(BYFoodModel *)model
{
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:model.picture]];
    self.nameLabel.text = model.name;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",@(model.min_price)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
