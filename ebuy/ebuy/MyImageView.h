//
//  PasswordImageView.h
//  ebuy
//
//  Created by 陈宁 on 2017/3/29.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyImageView : UIImageView

@property (nonatomic, assign) BOOL isCovered;/**< 覆盖判定 */
@property (nonatomic, assign) int value;

@end
