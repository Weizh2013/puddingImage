//
//  JSONModel.m
//  pudding
//
//  Created by apple on 15/9/29.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import "JSONModel.h"

NSString *const kNumberId = @"_id";
NSString *const kAnimeCount = @"animeCount";
NSString *const kName = @"name";
NSString *const kImage = @"image";
NSString *const kHeight = @"height";
NSString *const kWidth = @"width";
NSString *const kURL = @"url";

@implementation JSONModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
    if (self = [super init]) {
        _numberId = dictionary[kNumberId];
        _animeCount = [dictionary[kAnimeCount]integerValue];
        _name = dictionary[kName];
        NSDictionary *tmpDic = dictionary[kImage];
        _height = [tmpDic[kHeight]integerValue];
        _width = [tmpDic[kWidth]integerValue];
        _url = tmpDic[kURL];
    }
    return self;
}

+ (id)modelWithDictionary:(NSDictionary *)dictionary{
    return [[self alloc]initWithDictionary:dictionary];
}

+ (NSArray *)modelsArrayWithjsonArray:(NSArray *)jsonArray{
    NSMutableArray *modelsArray = [NSMutableArray array];
    for (NSDictionary *dic in jsonArray) {
        [modelsArray addObject:[self modelWithDictionary:dic]];
    }
    return modelsArray;
}








@end
