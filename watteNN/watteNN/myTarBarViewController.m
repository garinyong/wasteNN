//
//  myTarBarViewController.m
//  watteNN
//
//  Created by gaoyong on 14-10-13.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "myTarBarViewController.h"

@interface myTarBarViewController ()

@end

@implementation myTarBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) hidTabBarBBB:(BOOL) hide
{
	if (self.view.subviews.count < 2 )
    {
		return;
	}
	
	UIView *contentView;
	
	if ( [[self.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] ) {
		contentView = [self.view.subviews objectAtIndex:1];
	} else {
		contentView = [self.view.subviews objectAtIndex:0];
	}
	
	if (hide) {
		contentView.frame = self.view.bounds;
	} else {
		contentView.frame = CGRectMake(self.view.bounds.origin.x,
									   self.view.bounds.origin.y,
									   self.view.bounds.size.width,
									   self.view.bounds.size.height - self.tabBar.frame.size.height);
	}
	
	self.tabBar.hidden = hide;
}

//- (void)hideTabBarN:(UITabBarController *) tabbarcontroller
//{
//    for(UIView *view in tabbarcontroller.view.subviews)
//    {
//        if([view isKindOfClass:[UITabBar class]])
//        {
//            if([UIScreen mainScreen].bounds.size.height==568)
//            {
//                [view setFrame:CGRectMake(view.frame.origin.x, 568 +20, view.frame.size.width, view.frame.size.height)];
//            }
//            else
//            {
//                [view setFrame:CGRectMake(view.frame.origin.x, 480+20, view.frame.size.width, view.frame.size.height)];
//            }
//            
//        }
//        else
//        {
//            if([UIScreen mainScreen].bounds.size.height==568)
//            {
//                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 568)];
//            }
//            else
//            {
//                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 480)];
//            }
//        }
//    }
//}
//
//- (void)showTabBarN:(UITabBarController *) tabbarcontroller
//{
//    for(UIView *view in tabbarcontroller.view.subviews)
//    {
//        if([view isKindOfClass:[UITabBar class]])
//        {
//            if([UIScreen mainScreen].bounds.size.height==568)
//            {
//                [view setFrame:CGRectMake(view.frame.origin.x, 519, view.frame.size.width, view.frame.size.height)];
//            }
//            else
//            {
//                [view setFrame:CGRectMake(view.frame.origin.x, 431, view.frame.size.width, view.frame.size.height)];
//            }
//        }
//        else
//        {
//            if([UIScreen mainScreen].bounds.size.height==568)
//            {
//                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 519)];
//            }
//            else
//            {
//                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 431)];
//            }
//        }
//    }
//}

- (void)hideTabBar:(BOOL)animated
{
    NSLog(@"self.view.bounds.size.height:%f",self.view.bounds.size.height);
    NSLog(@"self.tabBar.frame.origin.y:%f",self.tabBar.frame.origin.y);
    if (self.view.bounds.size.height>self.tabBar.frame.origin.y)
    {
        [UIView animateWithDuration:0.35
                         animations:^{
                             CGRect tabFrame = self.tabBar.frame;
                             tabFrame.origin.y = tabFrame.origin.y + tabFrame.size.height;
                             self.tabBar.frame = tabFrame;
                         }];
    }
}

- (void)showTabBar:(BOOL)animated
{
    NSLog(@"self.view.bounds.size.height:%f",self.view.bounds.size.height);
    NSLog(@"self.tabBar.frame.origin.y:%f",self.tabBar.frame.origin.y);
    if (self.view.bounds.size.height<=self.tabBar.frame.origin.y)
    {
        [UIView animateWithDuration:0.35
                         animations:^{
                             CGRect tabFrame = self.tabBar.frame;
                             tabFrame.origin.y = tabFrame.origin.y - tabFrame.size.height;
                             self.tabBar.frame = tabFrame;
                         }];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
