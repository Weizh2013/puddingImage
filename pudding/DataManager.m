//
//  DataManager.m
//  pudding
//
//  Created by customer on 15/9/29.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import "DataManager.h"

static DataManager *instant = nil;
@implementation DataManager

+ (void)initialize{
    if (instant == nil) {
        instant = [self new];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://pudding.cc/api/v1/category?offset=0&limit=18&apiKey=yuki_android&version=2.6.5&timestamp=1442739762&auth1=76d6029863f2c0c3081e9dea9b67d0ee"]] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (error == nil) {
                instant.handle();
                NSLog(@"length:%ld",data.length);
            }else {
                NSLog(@"error:%@",error);
            }
        }];
        
        [dataTask resume];
    }
}

+ (instancetype)shareManagerComplementHandel:(HANDLETYPE)handle{
    instant.handle = handle;
    return instant;
}
@end
