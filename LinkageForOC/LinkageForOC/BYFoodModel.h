//
//  FoodModel.h
//  LinkageForOC
//
//  Created by lby on 2017/4/12.
//  Copyright © 2017年 lby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYFoodModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *foodId;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, assign) NSInteger praise_content;
@property (nonatomic, assign) NSInteger month_saled;
@property (nonatomic, assign) float min_price;

@end
