//
//  THTabBarController.h
//  customTabBarController-Master
//
//  Created by wanglj on 15/11/3.
//  Copyright © 2015年 wanglj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "THTabBarItem.h"
#import "THTabBar.h"
// 屏幕高度
#define SCREEN_HEIGHT         [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define SCREEN_WIDTH          [[UIScreen mainScreen] bounds].size.width
//按钮宽
#define normalButtonWidth     (SCREEN_WIDTH * 4 / 5) / 4
//高
#define tabBarHeight          CGRectGetHeight(self.THTabBar.frame)
//THTabBarItemRisel 按钮宽
#define publishItemWidth      (SCREEN_WIDTH / 5)



@interface THTabBarController : UITabBarController

@property (nonatomic ,strong) NSMutableArray *tabBarControllers;

@property (nonatomic ,strong)NSMutableArray *tabBarItems;

@property (nonatomic ,strong)THTabBar *THTabBar;
/**
 *  初始化设置tabBarController的tabBarItem
 *
 *  @param frame             tabBarItem的Frame
 *  @param controller        tabBarItem对应的Controller  THTabBarItemRisel 类型下可以是nil
 *  @param title             tabBarItem的Title
 *  @param normalImageName   普通状态下的tabBarItem图片
 *  @param selectedImageName 选中状态下的tabBarItem图片
 *  @param tabBarItemType    tabBarItem的类型 
 *
 */

- (void)tabBarItemWithFrame:(CGRect)frame
                           controller:(UIViewController *)controller
                                title:(NSString *)title
                      normalImageName:(NSString *)normalImageName
                    selectedImageName:(NSString *)selectedImageName
                       tabBarItemType:(THTabBarItemType)tabBarItemType;
/**
 *  THTabBarItemRisel类型的点击方法
 */
- (void)tabBarDidSelectedRiseButton;

@end
