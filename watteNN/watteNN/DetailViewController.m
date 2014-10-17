//
//  DetailViewController.m
//  watteNN
//
//  Created by gaoyong on 14-10-9.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
//        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
    UIScrollView *contentView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    contentView.delegate = self;
    contentView.backgroundColor = [UIColor orangeColor];
    contentView.contentSize = CGSizeMake(self.view.bounds.size.width,self.view.bounds.size.height+200);
    //    contentView.bounces = YES;
    //    contentView.alwaysBounceVertical = YES;
    [self.view addSubview:contentView];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    static float mark1 = 0;      //静态变量，记录contentOffset上次的位置
    float offY = scrollView.contentOffset.y;   //本次contentOffset的位置
    if (offY > mark1) {      //offY > mark1 表示现在是下滚状态
        if (offY > 0) {        // 这个判断很关键，不信去掉试试
            [((myTarBarViewController *)self.tabBarController) setTabBarHiddenOnViewController:YES vc:self];   //隐藏tabbar
        }
        
    }
    else              //offY < mark1 表示现在是上滚状态
    {
        if (offY < scrollView.contentSize.height - scrollView.frame.size.height) {  // 这个判断很关键，不信去掉试试
            [((myTarBarViewController *)self.tabBarController) setTabBarHiddenOnViewController:NO vc:self];   //不隐藏tabbar
        }
        
    }
    mark1 = offY;    ///静态变量记录contentOffset本次的位置
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
