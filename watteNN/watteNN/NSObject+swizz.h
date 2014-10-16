//
//  NSObject+swizz.h
//  watteNN
//
//  Created by gaoyong on 14-10-16.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

@interface NSObject (swizz)

+(void) swizz_exchangeInstanceMethod:(SEL) originSEL newSEL:(SEL) newSEL;

+(void) swizz_exchangeClassMethod:(SEL) originSEL newSEL:(SEL) newSEL;

@end
