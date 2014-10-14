//
//  AppDelegate.h
//  watteNN
//
//  Created by gaoyong on 14-10-9.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "TestViewController.h"
#import "myTarBarViewController.h"
#import "myNavViewController.h"
#import "WahahaViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+(myTarBarViewController *) getTarBarViewController;

@end
