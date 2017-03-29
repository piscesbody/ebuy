//
//  FirstViewController.m
//  ebuy
//
//  Created by 陈宁 on 2017/3/29.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import "FirstViewController.h"
#import "PasswordImageView.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _imageArray = [[NSMutableArray alloc]init];
    
    NSMutableArray *numberArray = [[NSMutableArray alloc]initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0", nil];
    
    for (int i = 0; i < 4; i++) {
        PasswordImageView *imageView = [[PasswordImageView alloc]init];
        imageView.frame = CGRectMake(24+(50+24)*i, 90, 50, 50);
        
//        imageView.backgroundColor = [UIColor redColor];
        
        int random = arc4random()%(10-i);
        NSString *numberStr = [numberArray objectAtIndex:random];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"b_%@.png",numberStr]];
        imageView.tag = [numberStr intValue];
        
        [self.view addSubview:imageView];
        [_imageArray addObject:imageView];
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
