//
//  RainView.m
//  ebuy
//
//  Created by 陈宁 on 2017/4/4.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import "RainView.h"

@implementation RainView
@synthesize isRain = _isRain;
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        _rainArray = [[NSMutableArray alloc]init];
        for (int i = 0; i <50; i++) {
            UIImageView *rain = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"w_rain.png"]];
            rain.tag = 10;
            rain.frame = CGRectMake(arc4random()%414, -20, 10, 20);
            [self addSubview:rain];
            [_rainArray addObject:rain];
        }
    }
    return self;
}

-(void)setIsRain:(BOOL)isRain
{
    _isRain = isRain;
    if (_isRain == YES) {
        if (_timer == nil) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerMethod) userInfo:nil repeats:YES];
        }
    }else{
        if (_timer != nil) {
            [_timer invalidate];
            _timer = nil;
        }
        
        for (UIImageView *rain in _rainArray) {
            if (rain.tag == 11) {
                rain.tag = 10;
                rain.frame = CGRectMake(arc4random()%414, -20, 10, 20);
            }
        }
    }
}

-(void)timerMethod
{
    static int count = 0;
    count++;
    if (count%5 == 0) {
        [self findRain];
    }
    [self moveRain];
}

-(void)findRain
{
    for (UIImageView *rain in _rainArray) {
        if (rain.tag == 10) {
            rain.tag =11;
            break;
        }
    }
}

-(void)moveRain
{
    for (UIImageView *rain in _rainArray) {
        if (rain.tag == 11) {
            CGRect rect = rain.frame;
            rect.origin.y += 10;
            rain.frame = rect;
            
            if (rect.origin.y >500) {
                rain.tag = 10;
                rain.frame = CGRectMake(arc4random()%414, -20, 10, 20);
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
