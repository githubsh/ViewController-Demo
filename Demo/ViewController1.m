//
//  ViewController.m
//  Demo
//
//  Created by 厘米科技 on 16/9/29.
//  Copyright © 2016年 厘米科技. All rights reserved.
//

#import "ViewController1.h"
#import "AppDelegate.h"

#import "ViewController3.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 150, 30)];
    [btn setTitle:@"进入Tab购物车" forState:0];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(click1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 150, 30)];
    [btn2 setTitle:@"进入当前nav下级购物车" forState:0];
    btn2.titleLabel.font = [UIFont systemFontOfSize:13];
    btn2.backgroundColor = [UIColor redColor];
    [btn2 addTarget:self action:@selector(click2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)click1
{
    AppDelegate *app = ((AppDelegate *)[UIApplication sharedApplication].delegate);
    app.rootTab.selectedIndex = 2;
}

- (void)click2
{
    ViewController3 *vc3 = [[ViewController3 alloc]init];
    vc3.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc3 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
