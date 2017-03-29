//
//  ItemButton.h
//  ebuy
//
//  Created by 陈宁 on 2017/3/29.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyImageView.h"

@interface MyButton : UIButton
@property (nonatomic, assign) CGPoint beginCenter;/**< 初始位置 */
@property (nonatomic, assign) BOOL isTOP;/**< 是否在密码视图上 */
@property (nonatomic, retain) MyImageView *coveredView;/**< 底部视图 */
@end
