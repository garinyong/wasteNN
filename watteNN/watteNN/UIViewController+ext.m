//
//  UIViewController+ext.m
//  watteNN
//
//  Created by gaoyong on 14-10-15.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "UIViewController+ext.h"
#import <objc/runtime.h>

@implementation UIViewController (ext)

static char kHideTabBarInitingAssociatedKey;  //初始化时隐藏
static char kHideTabBarInitedAssociatedKey;   //已经初始化后隐藏

-(BOOL) isHideTabBarIniting_Associate
{
    id hiddenValue = objc_getAssociatedObject(self, &kHideTabBarInitingAssociatedKey);
    
    if (!hiddenValue) {
        return NO;
    }
    
    return [hiddenValue boolValue];
}

-(void) setTabBarHiddenValueIniting_Associate:(BOOL) hiddenValue
{
    objc_setAssociatedObject(self, &kHideTabBarInitingAssociatedKey, [NSNumber numberWithBool:hiddenValue], OBJC_ASSOCIATION_COPY_NONATOMIC);
}


-(BOOL) isHideTabBarInited_Associate
{
    id hiddenValue = objc_getAssociatedObject(self, &kHideTabBarInitedAssociatedKey);
    
    if (!hiddenValue) {
        return NO;
    }
    
    return [hiddenValue boolValue];
}

-(void) setTabBarHiddenValueInited_Associate:(BOOL) hiddenValue
{
    objc_setAssociatedObject(self, &kHideTabBarInitedAssociatedKey, [NSNumber numberWithBool:hiddenValue], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
