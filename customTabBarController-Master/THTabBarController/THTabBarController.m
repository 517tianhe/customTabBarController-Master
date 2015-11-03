//
//  THTabBarController.m
//  customTabBarController-Master
//
//  Created by wanglj on 15/11/3.
//  Copyright © 2015年 wanglj. All rights reserved.
//

#import "THTabBarController.h"


@interface THTabBarController ()<THTabBarDelegate>



@end

@implementation THTabBarController

- (NSMutableArray *)tabBarControllers
{
    if (!_tabBarControllers) {
        _tabBarControllers = [[NSMutableArray alloc]init];
    }
    return _tabBarControllers;
}
- (NSMutableArray *)tabBarItems
{
    if (!_tabBarItems) {
        _tabBarItems = [[NSMutableArray alloc]init];
    }
    return _tabBarItems;
}
- (THTabBar *)THTabBar
{
    if (!_THTabBar) {
        _THTabBar = [[THTabBar alloc]initWithFrame:self.tabBar.bounds];
    }
    return _THTabBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tabBarItemWithFrame:(CGRect)frame controller:(UIViewController *)controller title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName tabBarItemType:(THTabBarItemType)tabBarItemType
{
    THTabBarItem *item = [[THTabBarItem alloc]initWithFrame:frame];
    
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitle:title forState:UIControlStateSelected];
    item.titleLabel.font = [UIFont systemFontOfSize:8];
    
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    [item setImage:normalImage forState:UIControlStateNormal];
    [item setImage:selectedImage forState:UIControlStateSelected];
    
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateNormal];
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateSelected];
    
    item.tabBarItemType = tabBarItemType;
    
    [self.tabBarItems addObject:item];
    
    if (tabBarItemType == THTabBarItemNormal) {
       [self.tabBarControllers addObject:controller];
    }
    
    self.viewControllers = [NSArray arrayWithArray:self.tabBarControllers];
    self.THTabBar.tabBarItems = [NSArray arrayWithArray:self.tabBarItems];
    self.THTabBar.delegate = self;
    [self.tabBar addSubview:self.THTabBar];
    
}


- (void)tabBarDidSelectedRiseButton
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
