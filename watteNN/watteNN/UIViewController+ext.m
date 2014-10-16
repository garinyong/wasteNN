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

static char kHideTabBarInitingAssociatedKey;  //初始化时隐藏
static char kHideTabBarInitedAssociatedKey;   //已经初始化后隐藏

+(void) load
{
    [swizzMethod swizz_exchangeInstanceMethod:[self class] originalSelector:@selector(viewWillDisappear:) newSEL:@selector(viewWillDisappearExt:)];
}

+(void) initialize
{
    NSLog(@"%@ initialize",[[self class] description]);
}

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

-(void) viewWillDisappearExt:(BOOL)animated
{
    NSLog(@"呵呵呵%@",[[self class] description]);
    
    [((myTarBarViewController *)self.tabBarController) setTabBarHidden:NO];
    
    [self viewWillDisappearExt:animated];
}

@end
