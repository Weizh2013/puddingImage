//
//  NetWorkManager.m
//  pudding
//
//  Created by apple on 15/9/30.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import "NetWorkManager.h"
#import "DIEToolkits.h"
#import "AFNetworking.h"

@implementation NetworkManager
+ (void)categoryWithOffset:(NSInteger)offset limit:(NSInteger)limit
                completion:(CompletionType)completion {
    NSDictionary *params = [DIEToolkit fullParams:@{
                                                    @"offset":@(offset),
                                                    @"limit":@(limit)
                                                    }];
    [[AFHTTPSessionManager manager] GET:[DIEToolkit categoryApi]
                             parameters:params success:^(NSURLSessionDataTask *task, id
                                                         responseObject) {
                                 completion(responseObject, nil);
                             } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                 DIEError *err = [[DIEError alloc] initWithError:error];
                                 completion(nil, err);
                             }];
}
@end