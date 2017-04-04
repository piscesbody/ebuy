//
//  NewsViewController.m
//  ebuy
//
//  Created by 陈宁 on 2017/4/3.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()
{
    NSArray *_titleArray;
    NSMutableArray *_contentImageArray;
}

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _titleArray = @[@"头条",@"娱乐",@"体育",@"科技",@"财经",@"时尚"];
    _contentImageArray = [[NSMutableArray alloc]init];
    for (int i = 0; i <6 ; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"news_%d.png",i+1]];
        [_contentImageArray addObject:image];
    }
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
