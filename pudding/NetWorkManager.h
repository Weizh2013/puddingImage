//
//  NetWorkManager.h
//  pudding
//
//  Created by apple on 15/9/30.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DIEError.h"
typedef void(^CompletionType)(id responseObject, DIEError *error);

@interface NetworkManager : NSObject
+ (void)categoryWithOffset:(NSInteger)offset limit:
(NSInteger)limit completion:(CompletionType)completion;
@end