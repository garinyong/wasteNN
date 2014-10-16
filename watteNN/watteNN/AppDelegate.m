//
//  AppDelegate.m
//  watteNN
//
//  Created by gaoyong on 14-10-9.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "AppDelegate.h"
#import "swizzMethod.h"

static myTarBarViewController *curTarBarViewController;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    Method ori_Method =  class_getInstanceMethod([UIViewController class], @selector(viewWillAppear:));
//    Method my_Method = class_getInstanceMethod([UIViewController class], @selector(viewWillAppearExt:));
//    method_exchangeImplementations(ori_Method, my_Method);
    
//    [swizzMethod swizz_exchangeInstanceMethod:[UIViewController class] originSEL:@selector(viewWillDisappear:) newClass:[UIViewController class] newSEL:@selector(viewWillDisappearExt:)]
    
//    [swizzMethod swizz_exchangeInstanceMethod:[NSArray class] originSEL:@selector(lastObject) newClass:[NSArray class] newSEL:@selector(myLastObject)];
    
    NSArray *array = @[@"0",@"1",@"2",@"3"];
    NSString *string = [array lastObject];
    NSLog(@"TEST RESULT : %@",string);
    
    
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ViewController *v1 =[ViewController new];
    
    myNavViewController *nav1=[[myNavViewController alloc] initWithRootViewController:v1];
    
    TestViewController *v2 =[TestViewController new];
    
    myNavViewController *nav2=[[myNavViewController alloc] initWithRootViewController:v2];
    
    TestViewController *v3 =[TestViewController new];
    
    myNavViewController *nav3=[[myNavViewController alloc] initWithRootViewController:v3];
    
    curTarBarViewController = [[myTarBarViewController alloc] init];
    curTarBarViewController.viewControllers = @[nav1,nav2,nav3];
    
    UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:1];
    nav1.tabBarItem = item;
    nav1.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",9];
    
    item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:1];
    nav2.tabBarItem = item;
    nav2.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",10];
    
    item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:1];
    nav3.tabBarItem = item;
    nav3.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d",10];

    
    self.window.rootViewController=curTarBarViewController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

+(myTarBarViewController *) getTarBarViewController
{
    return curTarBarViewController;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
