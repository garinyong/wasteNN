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

-(void) setTabBarHidden:(BOOL) hide
{
	if (self.view.subviews.count < 2)
    {
		return;
	}
	
	UIView *contentView;
	
	if ( [[self.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
    {
		contentView = [self.view.subviews objectAtIndex:1];
	}
    else
    {
		contentView = [self.view.subviews objectAtIndex:0];
	}
	
	if (hide)
    {
		contentView.frame = self.view.bounds;
	}
    else
    {
		contentView.frame = CGRectMake(self.view.bounds.origin.x,
									   self.view.bounds.origin.y,
									   self.view.bounds.size.width,
                                       self.view.bounds.size.height - self.tabBar.frame.size.height);
	}
	
	self.tabBar.hidden = hide;
}

- (void)showTabBar
{
    if (self.view.bounds.size.height <= self.tabBar.frame.origin.y)
    {
        CGRect tabFrame = self.tabBar.frame;
        tabFrame.origin.y = tabFrame.origin.y - tabFrame.size.height;
        self.tabBar.frame = tabFrame;
    }
}

- (void) hideTabBar
{
    if (self.view.bounds.size.height > self.tabBar.frame.origin.y)
    {
        CGRect tabFrame = self.tabBar.frame;
        tabFrame.origin.y = tabFrame.origin.y + tabFrame.size.height;
        self.tabBar.frame = tabFrame;
    }
}

@end
