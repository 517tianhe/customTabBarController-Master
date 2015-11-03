//
//  THTabBar.h
//  customTabBarController-Master
//
//  Created by wanglj on 15/11/3.
//  Copyright © 2015年 wanglj. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol THTabBarDelegate <NSObject>

@required
- (void)tabBarDidSelectedRiseButton;

@end

@interface THTabBar : UIView

@property (nonatomic ,strong) NSArray *tabBarItems;
@property (nonatomic ,strong) id<THTabBarDelegate> delegate;

@end
