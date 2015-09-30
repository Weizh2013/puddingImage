//
//  DIENotificationConfig.h
//  pudding
//
//  Created by apple on 15/9/30.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DIEPost(name, obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj]
#define DIEAddObserver(observer, action, n, obj) [[NSNotificationCenter defaultCenter] addObserver:observer selector:action name:n object:obj]
#define DIERemoveObserver(observer, n, obj) [[NSNotificationCenter defaultCenter] removeObserver:observer name:n object:obj]
FOUNDATION_EXTERN NSString * const kDIECategoryUpdateNotif;