//
//  CloudView.m
//  ebuy
//
//  Created by 陈宁 on 2017/4/4.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import "CloudView.h"

@implementation CloudView
@synthesize isCloud = _isCloud;
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        _cloudArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < 15; i++) {
            UIImageView *cloud = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"w_cloud"]];
            cloud.frame = CGRectMake(414, arc4random()%500, 150, 100);
            cloud.tag = 10;
            [self addSubview:cloud];
            [_cloudArray addObject:cloud];
        }
    }
    return self;
}

-(void)setIsCloud:(BOOL)isCloud
{
    _isCloud = isCloud;
    if (_isCloud == YES) {
        if (_timer == nil) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
            [_timer fire];
        }
    }else{
        if (_timer != nil) {
            [_timer invalidate];
            _timer = nil;
        }
        for (UIImageView *cloud in _cloudArray) {
            if (cloud.tag == 11) {
                cloud.tag = 10;
                cloud.frame = CGRectMake(414, arc4random()%500, 150, 100);
            }
        }
    }
}

-(void)timerMethod
{
    static int count = 0;
    count ++;
    if (count%10 == 0) {
        [self findCloud];
    }
    [self moveCloud];
}

-(void)findCloud
{
    for (UIImageView *cloud in _cloudArray) {
        if (cloud.tag == 10) {
            cloud.tag = 11;
            break;
        }
    }
}

-(void)moveCloud
{
    for (UIImageView *cloud in _cloudArray) {
        if (cloud.tag == 11) {
            CGRect rect = cloud.frame;
            rect.origin.x -= 10;
            cloud.frame = rect;
            if (rect.origin.x < -150) {
                cloud.tag = 10;
                cloud.frame = CGRectMake(414, arc4random()%500, 150, 100);
            }
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
