//
//  FirstViewController.h
//  ebuy
//
//  Created by 陈宁 on 2017/3/29.
//  Copyright © 2017年 陈宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
{
    
    NSMutableArray *_imageArray;/**< 密码视图数组 */
    NSMutableArray *_itemArray;/**< 按钮数组 */
    int _count;/**< 正确次数 */
}

@end
