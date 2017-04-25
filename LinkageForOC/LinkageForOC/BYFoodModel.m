//
//  FoodModel.m
//  LinkageForOC
//
//  Created by lby on 2017/4/12.
//  Copyright © 2017年 lby. All rights reserved.
//

#import "BYFoodModel.h"

@implementation BYFoodModel

+ (NSDictionary *)replacedKeyFromPropertyName
{
    NSDictionary *dict = @{
                           @"foodId": @"id"
                           };
    return dict;
}

@end
