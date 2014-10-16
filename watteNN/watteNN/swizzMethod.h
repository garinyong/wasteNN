//
//  swizzMethod.h
//  watteNN
//
//  Created by gaoyong on 14-10-16.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

@interface swizzMethod : NSObject

+(void) swizz_exchangeInstanceMethod:(Class) class originalSelector:(SEL) originalSelector newSEL:(SEL) alternativeSelector;
+(void) swizz_exchangeClassMethod:(Class) class originalSelector:(SEL) originalSelector newSEL:(SEL) alternativeSelector;

@end
