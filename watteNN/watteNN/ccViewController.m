//
//  ccViewController.m
//  watteNN
//
//  Created by gaoyong on 14-10-14.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "ccViewController.h"

@interface ccViewController ()

@end

@implementation ccViewController

-(void) dealloc
{

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.hidesBottomBarWhenPushed_DangDang = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(30,100,120, 44);
    btn1.titleLabel.textAlignment = NSTextAlignmentLeft;
    btn1.backgroundColor = [UIColor greenColor];
    btn1.layer.borderWidth = 0.5;
    btn1.layer.borderColor =[UIColor blueColor].CGColor;
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [btn1 setTitle:@"pop" forState:UIControlStateNormal];
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
    [btn1 setTitle:@"pop to" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(getClick2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}

-(void) getClick1
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) getClick2
{
    [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
