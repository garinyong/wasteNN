//
//  AbcViewController.m
//  watteNN
//
//  Created by gaoyong on 14-10-13.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "AbcViewController.h"
#import "WahahaViewController.h"

@interface AbcViewController ()

@end

@implementation AbcViewController

-(void) dealloc
{
    
}

-(id) init
{
    if (self=[super init]) {
//        [[AppDelegate getTarBarViewController] hidTabBarBBB:YES];
//        self.hidesBottomBarWhenPushed = YES;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(30,100,120, 44);
    btn1.titleLabel.textAlignment = NSTextAlignmentLeft;
    btn1.backgroundColor = [UIColor greenColor];
    btn1.layer.borderWidth = 0.5;
    btn1.layer.borderColor =[UIColor blueColor].CGColor;
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [btn1 setTitle:@"push" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(getClick1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(30,150,120, 44);
    btn1.titleLabel.textAlignment = NSTextAlignmentLeft;
    btn1.backgroundColor = [UIColor greenColor];
    btn1.layer.borderWidth = 0.5;
    btn1.layer.borderColor =[UIColor blueColor].CGColor;
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [btn1 setTitle:@"show" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(getClick3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(30,200,120, 44);
    btn1.titleLabel.textAlignment = NSTextAlignmentLeft;
    btn1.backgroundColor = [UIColor greenColor];
    btn1.layer.borderWidth = 0.5;
    btn1.layer.borderColor =[UIColor blueColor].CGColor;
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [btn1 setTitle:@"hide" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(getClick2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}

-(void) getClick1
{
//    [[AppDelegate getTarBarViewController] hideTabBar:YES];
//    self.tabBarController.tabBar.hidden = YES;
    
//    [[AppDelegate getTarBarViewController] hideTabBarN:[AppDelegate getTarBarViewController]];
    
//    [[AppDelegate getTarBarViewController] hidTabBarBBB:YES];
    
    
    WahahaViewController *vc = [WahahaViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void) getClick2
{
    [[AppDelegate getTarBarViewController] hidTabBarBBB:YES];
}

-(void) getClick3
{
    [[AppDelegate getTarBarViewController] hidTabBarBBB:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
