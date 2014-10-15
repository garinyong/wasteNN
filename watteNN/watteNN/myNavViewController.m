//
//  myNavViewController.m
//  watteNN
//
//  Created by gaoyong on 14-10-14.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "myNavViewController.h"
#import <objc/runtime.h>
#import "UIViewController+ext.h"
#import "myTarBarViewController.h"


@interface myNavViewController ()

@end

@implementation myNavViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- 重写方法

- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    [((myTarBarViewController *)self.tabBarController) setTabBarHidden:NO];
    //when viewController disappear invoke
    
    if(viewController.hidesBottomBarWhenPushed)
    {
        viewController.hidesBottomBarWhenPushed = NO;
        [viewController setTabBarHiddenValueIniting_Associate:YES];
        [self rootViewController].hidesBottomBarWhenPushed = YES;
    }
    else
    {
        [self rootViewController].hidesBottomBarWhenPushed = NO;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *) popViewControllerAnimated:(BOOL)animated
{
//    [((myTarBarViewController *)self.tabBarController) setTabBarHidden:NO];
    
    UIViewController *vc = self.viewControllers[self.viewControllers.count - 2];
    
    if ([vc isHideTabBarIniting_Associate])
    {
        [self rootViewController].hidesBottomBarWhenPushed = YES;
    }
    else
    {
        [self rootViewController].hidesBottomBarWhenPushed = NO;
    }
    
    [self.topViewController setTabBarHiddenValueIniting_Associate:NO];
    
    return [super popViewControllerAnimated:animated];
}

- (NSArray *) popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    [((myTarBarViewController *)self.tabBarController) setTabBarHidden:NO];
    
    if([viewController isHideTabBarIniting_Associate])
    {
        [self rootViewController].hidesBottomBarWhenPushed = YES;
    }
    else
    {
        [self rootViewController].hidesBottomBarWhenPushed = NO;
    }
    
    for (long i = self.viewControllers.count - 1; i > 0; i--)
    {
        UIViewController *tem = [self.viewControllers objectAtIndex:i];
        
        if(tem == viewController)
        {
            break;
        }
        
        [tem setTabBarHiddenValueIniting_Associate:NO];
    }
    
    return [super popToViewController:viewController animated:animated];
}

- (NSArray *) popToRootViewControllerAnimated:(BOOL)animated
{
//    [((myTarBarViewController *)self.tabBarController) setTabBarHidden:NO];
    
    if ([[self rootViewController] isHideTabBarIniting_Associate])
    {
        [self rootViewController].hidesBottomBarWhenPushed = YES;
    }
    else
    {
        [self rootViewController].hidesBottomBarWhenPushed = NO;
    }
    
    for (long i = self.viewControllers.count - 1; i > 0; i--)
    {
        UIViewController *tem = [self.viewControllers objectAtIndex:i];
        [tem setTabBarHiddenValueIniting_Associate:NO];
    }
    
    return [super popToRootViewControllerAnimated:animated];
}

- (UIViewController *) rootViewController
{
    return (UIViewController *)self.viewControllers.firstObject;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
