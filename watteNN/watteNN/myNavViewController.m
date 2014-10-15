//
//  myNavViewController.m
//  watteNN
//
//  Created by gaoyong on 14-10-14.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "myNavViewController.h"

@interface myNavViewController ()

@end

@implementation myNavViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        self.delegate = self;
        
        _viewControllersWithHiddenBottomBar = [[NSMutableSet alloc] init];
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

- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(viewController.hidesBottomBarWhenPushed)
    {
        viewController.hidesBottomBarWhenPushed = NO;
        [_viewControllersWithHiddenBottomBar addObject:viewController];
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
    if([_viewControllersWithHiddenBottomBar containsObject:self.viewControllers[self.viewControllers.count - 2]])
    {
        [self rootViewController].hidesBottomBarWhenPushed = YES;
    }
    else
    {
        [self rootViewController].hidesBottomBarWhenPushed = NO;
    }
    UIViewController *poppedViewController = [super popViewControllerAnimated:animated];
    [_viewControllersWithHiddenBottomBar removeObject:poppedViewController];
    return poppedViewController;
}

- (NSArray *) popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if([_viewControllersWithHiddenBottomBar containsObject:viewController])
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
        
        [_viewControllersWithHiddenBottomBar removeObject:tem];
    }
    
    return [super popToViewController:viewController animated:animated];
}

- (NSArray *) popToRootViewControllerAnimated:(BOOL)animated
{
    if([_viewControllersWithHiddenBottomBar containsObject:[self rootViewController]])
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
        [_viewControllersWithHiddenBottomBar removeObject:tem];
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
