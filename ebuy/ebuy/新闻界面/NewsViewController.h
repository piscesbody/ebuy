//
//  NewsViewController.h
//  ebuy
//
//  Created by 陈宁 on 2017/4/3.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController
{
    __weak IBOutlet UIView *_bgView;
    __weak IBOutlet UIView *_frontView;
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UIImageView *_contentImageView;
}

@end
