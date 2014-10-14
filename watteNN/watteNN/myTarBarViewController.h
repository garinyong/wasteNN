//
//  myTarBarViewController.h
//  watteNN
//
//  Created by gaoyong on 14-10-13.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myTarBarViewController : UITabBarController<UITabBarControllerDelegate>
{

}

- (void)showTabBar:(BOOL)animated;
- (void)hideTabBar:(BOOL)animated;


//- (void)hideTabBarN:(UITabBarController *) tabbarcontroller;
//- (void)showTabBarN:(UITabBarController *) tabbarcontroller;

-(void) hidTabBarBBB:(BOOL) hide;
@end
