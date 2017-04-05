//
//  CloudView.h
//  ebuy
//
//  Created by 陈宁 on 2017/4/4.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CloudView : UIView
{
    NSMutableArray *_cloudArray;
    NSTimer *_timer;
    BOOL _isCloud;
}
@property (nonatomic, assign) BOOL isCloud;

@end
