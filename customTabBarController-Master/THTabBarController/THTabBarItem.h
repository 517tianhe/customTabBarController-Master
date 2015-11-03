//
//  THTabBarItem.h
//  customTabBarController-Master
//
//  Created by wanglj on 15/11/3.
//  Copyright © 2015年 wanglj. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, THTabBarItemType) {
    THTabBarItemNormal = 0,//一般的类型 点击切换控制器
    THTabBarItemRise,      //特殊情况 点击出现自定义的视图
};
@interface THTabBarItem : UIButton

@property (nonatomic, assign) THTabBarItemType tabBarItemType;

@end
