//
//  RainView.h
//  ebuy
//
//  Created by 陈宁 on 2017/4/4.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RainView : UIView
{
    NSMutableArray *_rainArray;
    NSTimer *_timer;
    BOOL _isRain;
}
@property (nonatomic, assign) BOOL isRain;

@end
