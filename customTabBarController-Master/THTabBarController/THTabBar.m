//
//  THTabBar.m
//  customTabBarController-Master
//
//  Created by wanglj on 15/11/3.
//  Copyright © 2015年 wanglj. All rights reserved.
//

#import "THTabBar.h"
#import "THTabBarItem.h"

// 屏幕高度
#define SCREEN_HEIGHT         [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define SCREEN_WIDTH          [[UIScreen mainScreen] bounds].size.width

@implementation THTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self config];
    }
    
    return self;
}

- (void)config {
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *topLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, -5, SCREEN_WIDTH, 5)];
    topLine.image = [UIImage imageNamed:@"tapbar_top_line"];
    [self addSubview:topLine];
}

- (void)setTabBarItems:(NSArray *)tabBarItems {
    _tabBarItems = tabBarItems;
    NSInteger itemTag = 0;
    for (id item in tabBarItems) {
        if ([item isKindOfClass:[THTabBarItem class]]) {
            if (itemTag == 0) {
                ((THTabBarItem *)item).selected = YES;
            }
            [((THTabBarItem *)item) addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:item];
            if (((THTabBarItem *)item).tabBarItemType != THTabBarItemRise) {
                ((THTabBarItem *)item).tag = itemTag;
                itemTag++;
            }
        }
    }
}

- (void)itemSelected:(THTabBarItem *)sender {
    if (sender.tabBarItemType != THTabBarItemRise) {
        [self setSelectedIndex:sender.tag];
    } else {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(tabBarDidSelectedRiseButton)]) {
                [self.delegate tabBarDidSelectedRiseButton];
            }
        }
    }
}

- (void)setSelectedIndex:(NSInteger)index {
    for (THTabBarItem *item in self.tabBarItems) {
        if (item.tag == index) {
            item.selected = YES;
        } else {
            item.selected = NO;
        }
    }
    
    UITabBarController *tabBarController = (UITabBarController *)self.delegate;
    if (tabBarController) {
        tabBarController.selectedIndex = index;
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
