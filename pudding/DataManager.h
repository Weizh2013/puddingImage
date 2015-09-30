//
//  DataManager.h
//  pudding
//
//  Created by customer on 15/9/29.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HANDLETYPE)();
//void add();

@interface DataManager : NSObject

@property (nonatomic,strong,readonly) NSMutableArray *categoriesArray;

+ (instancetype)sharedManager;
- (void)updateCategory;

@end
