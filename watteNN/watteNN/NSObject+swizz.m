//
//  NSObject+swizz.m
//  watteNN
//
//  Created by gaoyong on 14-10-16.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "NSObject+swizz.h"

@implementation NSObject (swizz)

+(void) swizz_exchangeInstanceMethod:(SEL) originSEL newSEL:(SEL) newSEL
{
    Method ori_Method =  class_getInstanceMethod([self class], originSEL);
    
    if (!ori_Method)
    {
        return;
    }
    
    Method my_Method = class_getInstanceMethod([self class], newSEL);
    
    if (!my_Method)
    {
        return;
    }
    
    method_exchangeImplementations(ori_Method, my_Method);
}

+(void) swizz_exchangeClassMethod:(SEL) originSEL newSEL:(SEL) newSEL
{
    Method ori_Method =  class_getClassMethod([self class], originSEL);
    
    if (!ori_Method)
    {
        return;
    }
    
    Method my_Method = class_getClassMethod([self class], newSEL);
    
    if (!my_Method)
    {
        return;
    }
    
    method_exchangeImplementations(ori_Method, my_Method);
}

@end
