//
//  JSONModel.h
//  pudding
//
//  Created by apple on 15/9/29.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONModel : NSObject

@property (nonatomic,strong) NSString *numberId;
@property (nonatomic,assign) NSInteger animeCount;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) NSInteger height;
@property (nonatomic,assign) NSInteger width;
@property (nonatomic,strong) NSString *url;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

+ (id)modelWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)modelsArrayWithjsonArray:(NSArray *)jsonArray;

@end
