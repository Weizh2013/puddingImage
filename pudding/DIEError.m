//
//  DIEError.m
//  pudding
//
//  Created by apple on 15/9/30.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import "DIEError.h"

@implementation DIEError

+ (instancetype)errorWithCode:(NSInteger)code{
    return [[self alloc]initWithCode:code];
}

- (NSString *)explainErrorCode {
    NSString *reason = nil;
    switch (_errorCode) {
        case kDIENetworkErrorCodeNotFound: reason = @"资源不存在";
            break;
        case kDIENetworkErrorCodeNotAuth: reason = @"没有登录";
            break;
        default:
            break;
    }
    return reason;
}

- (NSString *)reason {
    if (!_reason) {
        _reason = [self explainErrorCode];
    }
    return _reason;
}

- (instancetype)initWithCode:(NSInteger)code{
    if (self = [super init]) {
        _errorCode = code;
    }
    return self;
}

- (instancetype)initWithError:(NSError *)error{
    if (self = [super init]) {
        _errorCode = error.code;
    }
    return self;
}

@end
