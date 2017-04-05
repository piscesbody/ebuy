//
//  WeatherViewController.m
//  ebuy
//
//  Created by 陈宁 on 2017/4/4.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import "WeatherViewController.h"
#import "RainView.h"
#import "CloudView.h"

@interface WeatherViewController ()
{
    BOOL _isNight;
    UIButton *_previousButton;
    UIImageView *_tipView;
    
    UIView *_animationView;
    int _selectDay;
    RainView *_rainView;
    CloudView *_cloudView;
    
}

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createScrollView];
    [self createAnimationView];
    _selectDay = 1;
    _isNight = NO;
    [self weather];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createAnimationView
{
    _animationView = [[UIView alloc]initWithFrame:CGRectMake(15, 80, 290, 295)];
    [self.view addSubview:_animationView];
    
    _rainView = [[RainView alloc]initWithFrame:CGRectMake(0, 0, 400, 616)];
    _rainView.isRain = NO;
    [_animationView addSubview:_rainView];
    
    _cloudView = [[CloudView alloc]initWithFrame:CGRectMake(0, 0, 400, 616)];
    _cloudView.isCloud = NO;
    [_animationView addSubview:_cloudView];
}

-(void)createScrollView
{
    NSArray *weekArray = @[@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期日"];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 650, 414, 70)];
    scrollView.contentSize = CGSizeMake(800, 70);
    scrollView.showsHorizontalScrollIndicator = NO;
    for (int i = 0; i<7; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(20+(90+20)*i, 10, 90, 55);
        [button setTitle:[weekArray objectAtIndex:i] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"w_xq2"] forState:UIControlStateNormal];
        button.tag = i+1;
        [button setBackgroundImage:[UIImage imageNamed:@"w_xq1"] forState:UIControlStateSelected];
        if (i == 0) {
            button.selected =YES;
            _previousButton = button;
            _tipView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"w_tip"]];
            _tipView.center = CGPointMake(button.center.x, 5);
            _tipView.bounds = CGRectMake(0, 0, 90, 10);
            [scrollView addSubview: _tipView];
        }
        [button addTarget:self action:@selector(weekButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button];
    }
    [self.view addSubview:scrollView];
}

-(void)weekButtonClick:(UIButton *)sender
{
    _previousButton.selected = NO;
    sender.selected = YES;
    _previousButton = sender;
    _tipView.center = CGPointMake(sender.center.x, 5);
    _selectDay = sender.tag;
    [self weather];
}
-(void)weather
{
    if ((_selectDay == 1||_selectDay == 5||_selectDay == 7||_selectDay == 6)&&_isNight == YES) {
        _cloudView.isCloud = NO;
        _rainView.isRain = YES;
    }else{
        _rainView.isRain = NO;
        _cloudView.isCloud = YES;
    }
}

-(void)removeAllAnimation
{
    for (UIView *view in _animationView.subviews) {
        [view removeFromSuperview];
    }
}
-(BOOL)prefersStatusBarHidden
{
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButtonClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)dayAndNightButtonClick:(UIButton *)sender {
    if (_isNight == NO) {
        [sender setTitle:@"夜晚" forState:UIControlStateNormal];
    }else{
        [sender setTitle:@"白天" forState:UIControlStateNormal];
    }
    _isNight = !_isNight;
    [self weather];
}
@end
