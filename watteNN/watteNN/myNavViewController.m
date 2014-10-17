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
    [((myTarBarViewController *)self.tabBarController) setTabBarHiddenOnViewController:viewController.tabBarHidden_associated vc:viewController];
    
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *) popViewControllerAnimated:(BOOL)animated
{
    UIViewController *viewController = self.viewControllers[self.viewControllers.count - 2];
    
    [((myTarBarViewController *)self.tabBarController) setTabBarHiddenOnViewController:viewController.tabBarHidden_associated vc:viewController];
    
    return [super popViewControllerAnimated:animated];
}

- (NSArray *) popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [((myTarBarViewController *)self.tabBarController) setTabBarHiddenOnViewController:viewController.tabBarHidden_associated vc:viewController];
    
    return [super popToViewController:viewController animated:animated];
}

- (NSArray *) popToRootViewControllerAnimated:(BOOL)animated
{
    if ([self rootViewController])
    {
        [((myTarBarViewController *)self.tabBarController) setTabBarHiddenOnViewController:[self rootViewController].tabBarHidden_associated vc:[self rootViewController]];
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
