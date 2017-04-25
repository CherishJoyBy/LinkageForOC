//
//  NSObject+BYProperty.h
//  LinkageForOC
//
//  Created by lby on 2017/4/13.
//  Copyright © 2017年 lby. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KeyValue <NSObject>

@optional
/**
 取出<嵌套着数组的字典>的值,该值为数组,并把该数组转换成模型对象
 
 @return 嵌套数组的字典(如:@{ @"spus": @"FoodModel" },spus是<嵌套着数组的字典>的key,@"FoodModel"是value,将value转换成模型)
 */
+ (NSDictionary *)objectClassInArray;

/**
 将自定义的属性名替换字典中的key
 
 @return 字典(key为自定义的属性名,value为实际json中字典中的key,如:@{@"foodId",@"id"},foodId是我们定义的属性,id是json字符串中的字典中的key)
 */
+ (NSDictionary *)replacedKeyFromPropertyName;

@end

@interface NSObject (BYProperty)<KeyValue>

/**
 通过传入的字典获取cateModel或FoodModel模型(FoodModel是嵌套在cateMedel中)
 
 @param dictionary 需要转换成模型的字典
 @return cateModel或FoodModel模型
 */
+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary;

@end
