//
//  TestViewController.m
//  watteNN
//
//  Created by gaoyong on 14-10-13.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "TestViewController.h"
#import "AbcViewController.h"
#import "AppDelegate.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(30,100,120, 44);
    btn1.titleLabel.textAlignment = NSTextAlignmentLeft;
    btn1.backgroundColor = [UIColor greenColor];
    btn1.layer.borderWidth = 0.5;
    btn1.layer.borderColor =[UIColor blueColor].CGColor;
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [btn1 setTitle:@"get action" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(getClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}

-(void) getClick
{
    AbcViewController *dvc = [AbcViewController new];
    [self.navigationController pushViewController:dvc animated:YES];
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
