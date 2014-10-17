//
//  UIViewController+ext.m
//  watteNN
//
//  Created by gaoyong on 14-10-15.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "UIViewController+ext.h"
#import <objc/runtime.h>
#import "swizzMethod.h"

@implementation UIViewController (ext)

static char kHideTabBarAssociatedKey;  //初始化时隐藏

-(BOOL) hidesBottomBarWhenPushed_DangDang
{
    id hiddenValue = objc_getAssociatedObject(self, &kHideTabBarAssociatedKey);
    
    if (!hiddenValue) {
        return NO;
    }
    
    return [hiddenValue boolValue];
}

-(void) setHidesBottomBarWhenPushed_DangDang:(BOOL)hidesBottomBarWhenPushed_DangDang
{
    objc_setAssociatedObject(self, &kHideTabBarAssociatedKey, [NSNumber numberWithBool:hidesBottomBarWhenPushed_DangDang], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
