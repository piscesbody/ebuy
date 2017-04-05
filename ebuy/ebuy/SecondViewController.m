//
//  SecondViewController.m
//  ebuy
//
//  Created by 陈宁 on 2017/3/29.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import "SecondViewController.h"
#import "RoundedButton.h"
#import "SearchViewController.h"
#import "CityViewController.h"
#import "NewsViewController.h"
#import "WeatherViewController.h"

@interface SecondViewController ()
{
    NSTimer *_timer;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *background = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    background.image = [UIImage imageNamed:@"bg2.jpg"];
    [self.view addSubview:background];
//    NSLog(@"%f,%f",background.center.x,background.center.y);
    // Do any additional setup after loading the view from its nib.
    for (int i = 0; i <4 ; i++) {
        RoundedButton *button = [[RoundedButton alloc]init];
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"m_item%d",i+1]] forState:UIControlStateNormal];
        button.angle = 90*i;
        button.tag = i+1;
        button.center = CGPointMake(207+130*cos(button.angle*M_PI/180), 368+120*sin(button.angle*M_PI/180));
        button.bounds = CGRectMake(0, 0, 50, 50);
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

-(void)buttonClick:(RoundedButton *)sender
{
    if (sender.angle%360 == 270) {
        [self tranfromToController:sender.tag];
    }else{
        if (_timer ==nil) {
            _timer =[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerMethod:) userInfo:sender repeats:YES];
            [_timer fire];
        }
    }
}

-(void)timerMethod:(NSTimer *)timer
{
    RoundedButton *button = timer.userInfo;
    for (int i = 0; i < 4; i++) {
        RoundedButton *btn = (RoundedButton *)[self.view viewWithTag:i+1];
        btn.angle += 10;
        btn.center = CGPointMake(207+120*cos(btn.angle*M_PI/180), 368+120*sin(btn.angle*M_PI/180));
    }
    if (button.angle%360 == 270) {
        NSLog(@"跳转");
        [_timer invalidate];
        _timer = nil;
        [self tranfromToController:button.tag];
    }
}

-(void)tranfromToController:(int)count
{
    UIViewController *viewController = nil;
    switch (count) {
        case 1:
        {
            viewController = [[WeatherViewController alloc]init];
        }
            break;
        case 2:
        {
            viewController = [[SearchViewController alloc]init];
        }
            break;
        case 3:
        {
            viewController = [[CityViewController alloc]init];
        }
            break;
        case 4:
        {
            viewController = [[NewsViewController alloc]init];
        }
        default:
            break;
    }
    [self.navigationController pushViewController:viewController  animated:YES];
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
