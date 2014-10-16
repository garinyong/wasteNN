//
//  swizzMethod.m
//  watteNN
//
//  Created by gaoyong on 14-10-16.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "swizzMethod.h"

@implementation swizzMethod

+(void) swizz_exchangeInstanceMethod:(Class) class originalSelector:(SEL) originalSelector newSEL:(SEL) alternativeSelector
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method alternativeMethod = class_getInstanceMethod(class, alternativeSelector);
    
    if(class_addMethod(class, originalSelector, method_getImplementation(alternativeMethod), method_getTypeEncoding(alternativeMethod))) {
        class_replaceMethod(class, alternativeSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, alternativeMethod);
    }
}

+(void) swizz_exchangeClassMethod:(Class) class originalSelector:(SEL) originalSelector newSEL:(SEL) alternativeSelector
{
    class = object_getClass(class);
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method alternativeMethod = class_getInstanceMethod(class, alternativeSelector);
    
    if(class_addMethod(class, originalSelector, method_getImplementation(alternativeMethod), method_getTypeEncoding(alternativeMethod))) {
        class_replaceMethod(class, alternativeSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, alternativeMethod);
    }
}

@end
