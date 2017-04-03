//
//  SearchViewController.m
//  ebuy
//
//  Created by 陈宁 on 2017/4/3.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
{
    UIView *_lineView;
    UIWebView *_webView;
    NSArray *_IPArray;
}

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _searchBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 60);
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 50)];
    scrollView.contentSize = CGSizeMake(90*10, 30);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.alwaysBounceHorizontal = NO;
    
    NSArray *titleArray = @[@"新浪微博",@"百度",@"智游",@"优酷",@"淘宝",@"谷歌",@"苹果官网",@"QQ空间",@"百度百科",@"新浪网"];
    
    for (int i = 0; i <10; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(10+(80+10)*i, 8, 80, 40);
        [button setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
        button.tag = i+1;
        [button addTarget:self action:@selector(scrollViewButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:button];
        
        if (i == 0) {
            _lineView = [[UIView alloc]init];
            _lineView.backgroundColor = [UIColor redColor];
            _lineView.center = CGPointMake(button.center.x, button.center.y+21);
            CGSize size = [button.currentTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}];
            _lineView.bounds = CGRectMake(0, 0, size.width, 2);
            [scrollView addSubview:_lineView];
        }
    }
    [self.view addSubview:scrollView];
    
    _IPArray = @[@"http://weibo.com",@"https://www.baidu.com",@"http://www.zhiyou100.com",@"http://www.youku.com",@"http://www.taobao.com",@"http://www.google.com.hk",@"http://www.apple.com/cn/",@"http://rc.qzone.qq.com",@"http://baike.baidu.com",@"http://www.sina.com.cn"];
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 112, self.view.frame.size.width, self.view.frame.size.height-110)];
    [self.view addSubview:_webView];
    [self loadURL:0];
    
}

-(void)loadURL:(int)count
{
    NSURL *url = [NSURL URLWithString:[_IPArray objectAtIndex:count]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}

-(void)scrollViewButtonClick:(UIButton *)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    CGSize size = [sender.currentTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}];
    _lineView.center = CGPointMake(sender.center.x, sender.center.y+21);
    _lineView.bounds = CGRectMake(0, 0, size.width, 2);
    [UIView commitAnimations];
    [self loadURL:sender.tag-1];
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

- (IBAction)buttonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
