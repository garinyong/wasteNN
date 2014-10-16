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

+(void) load
{
//    [swizzMethod swizz_exchangeInstanceMethod:[self class] originalSelector:@selector(viewWillDisappear:) newSEL:@selector(viewWillDisappearExt:)];
}

+(void) initialize
{
    NSLog(@"%@ initialize",[[self class] description]);
}

-(BOOL) tabBarHidden_associated
{
    id hiddenValue = objc_getAssociatedObject(self, &kHideTabBarAssociatedKey);
    
    if (!hiddenValue) {
        return NO;
    }
    
    return [hiddenValue boolValue];
}

-(void) setTabBarHidden_associated:(BOOL) hiddenValue
{
    objc_setAssociatedObject(self, &kHideTabBarAssociatedKey, [NSNumber numberWithBool:hiddenValue], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void) viewWillDisappearExt:(BOOL)animated
{
    NSLog(@"呵呵呵%@",[[self class] description]);
    
//    [((myTarBarViewController *)self.tabBarController) fixTabBarFrame];
    
    [self viewWillDisappearExt:animated];
}

@end
