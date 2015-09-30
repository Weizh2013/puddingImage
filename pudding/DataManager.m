//
//  DataManager.m
//  pudding
//
//  Created by customer on 15/9/29.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import "DataManager.h"
#import "NetWorkManager.h"
#import "DIENotificationConfig.h"
#import "JSONModel.h"

static DataManager *instant = nil;

@interface DataManager()
{
    NSUInteger _categoryOffset;
    NSUInteger _categoryLimit;
}

@end

@implementation DataManager

- (instancetype)init{
    if (self = [super init]) {
        _categoryOffset = 0;
        _categoryLimit = 20;
        _categoriesArray = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)sharedManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instant = [[DataManager alloc]init];
    });
    return instant;
}

- (void)updateCategory {
    [NetworkManager categoryWithOffset:_categoryOffset limit:_categoryLimit completion:^(id responseObject, DIEError *error) {
        NSArray *array = [self parseDataWith:responseObject];
        [_categoriesArray removeAllObjects];
        [_categoriesArray addObjectsFromArray:array];
        
        DIEPost(kDIECategoryUpdateNotif, nil);
    }];
    
}

- (NSArray *)parseDataWith:(id)data{
    NSArray *array = [JSONModel modelsArrayWithjsonArray:data];
    return array;
}

@end
