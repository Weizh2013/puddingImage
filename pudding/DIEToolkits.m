//
//  DIEToolkits.m
//  pudding
//
//  Created by apple on 15/9/30.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DIEToolkits.h"
#import "DIEApiConfig.h"

@implementation DIEToolkit

+ (NSDictionary *)deviceParams {
    NSUUID *uuid = [NSUUID UUID];
    UIDevice *device = [UIDevice currentDevice];
    return @{
             @"deviceKey":uuid.UUIDString,
             @"brand":@"Apple",
             @"channelId":@"App Store",
             @"model":device.model,
             @"os":device.systemName,
             @"osv":device.systemVersion,
             @"timestamp":@"1443513638"
             }; }

+ (NSDictionary *)appParams {
    return @{
             @"apiKey":@"yuki_ios",
             @"auth1":@"aeb64759231cc3ab7d771273a555e4fb",
             @"auth2":@"662a595550f05ed39f99367f2052f928",
             @"version":@"2.4.5"
             };
}

+ (NSDictionary *)fullParams:(NSDictionary *)params {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict addEntriesFromDictionary:[self deviceParams]];
    [dict addEntriesFromDictionary:[self appParams]];
    if (params) {
        [dict addEntriesFromDictionary:params];
    }
    return dict;
}

+ (NSString *)apiWithPath:(NSString *)path {
    return [kDIEHost stringByAppendingPathComponent:path];
}

+ (NSString *)categoryApi {
    return [self apiWithPath:kDIECategoryApi];
}

@end