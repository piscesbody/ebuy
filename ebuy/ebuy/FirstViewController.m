//
//  FirstViewController.m
//  ebuy
//
//  Created by 陈宁 on 2017/3/29.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import "FirstViewController.h"
#import "MyImageView.h"
#import "MyButton.h"
#import "SecondViewController.h"
#define WIDTH self.view.frame.size.width

@interface FirstViewController ()
{
    NSMutableArray *_imageViewArray;/**< 视图数组 */
    int _count;/**< 正确次数 */
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *background = [[UIImageView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    background.image = [UIImage imageNamed:@"bg.jpg"];
    [self.view addSubview:background];
    

    _imageViewArray = [[NSMutableArray alloc]init];
    
    NSMutableArray *numberArray = [[NSMutableArray alloc]initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0", nil];
    
    for (int i = 0; i < 4; i++) {
        MyImageView *imageView = [[MyImageView alloc]initWithFrame:CGRectMake((WIDTH-240)/4+((WIDTH-240)/4+60)*i, 80, 60, 60 )];
        
        int random = arc4random()%(10-i);
        
        NSString *number = [numberArray objectAtIndex:random];
        
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"b_%@.png",number]];
        
        imageView.value = [number intValue];
        
        [numberArray removeObject:number];
        
        imageView.isCovered = NO;
        
        [self.view addSubview:imageView];
        
        [_imageViewArray addObject:imageView];
    }
    
    for (int i = 0; i < 10; i++) {
        MyButton *button = [MyButton buttonWithType:UIButtonTypeSystem];
        
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"s_%d",i]] forState:UIControlStateNormal];
        
        button.frame = CGRectMake((WIDTH-200)/5+((WIDTH-200)/5+40)*(i%5), 300+((WIDTH-200)/5+40)*(i/5), 40, 40);
        
        button.tag = i;
        
        button.coveredView = nil;
        
        button.isTOP = NO;
        
        button.beginCenter = button.center;
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        
    }
}

-(void)buttonClick:(MyButton *)sender
{
    if (sender.isTOP == NO) {
        for (MyImageView *imageView in _imageViewArray) {
            if (imageView.isCovered == NO) {
                
                [UIView beginAnimations:@"top" context:(__bridge void *)(sender)];
                
                [UIView setAnimationDuration:1];
                
                [UIView setAnimationDelegate:self];
                
                [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
                
                sender.center = imageView.center;
                
                imageView.isCovered = YES;
                sender.coveredView = imageView;
                sender.isTOP = YES;
                [UIView commitAnimations];
                break;
            }
        }
    }else{
        [UIView beginAnimations:@"down" context:nil];
        
        [UIView setAnimationDuration:1];
        
        sender.center = sender.beginCenter;
        
        MyImageView *imageView = sender.coveredView;
        
        imageView.isCovered = NO;
        
        sender.coveredView = nil;
        
        sender.isTOP = NO;
        
        [UIView commitAnimations];
    }
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    MyButton *button = (__bridge MyButton *)(context);
    
    if ([animationID isEqualToString:@"top"]) {

        MyImageView *imageView = button.coveredView;
        if (_count == 0) {
            if (imageView.value == button.tag) {
                _count = 1;
                SecondViewController *secondVC = [[SecondViewController alloc]init];
                
                UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:secondVC];
                
                UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
                
                nav.navigationBarHidden = YES;
                
                window.rootViewController = nav;
                
                [UIView beginAnimations:nil context:nil];
                
                [UIView setAnimationDuration:1];
                
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:window cache:YES];
                
                [UIView commitAnimations];
                
                return;
            }
        }
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
