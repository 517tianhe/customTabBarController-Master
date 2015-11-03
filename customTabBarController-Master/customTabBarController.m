//
//  customTabBarController.m
//  customTabBarController-Master
//
//  Created by wanglj on 15/11/3.
//  Copyright © 2015年 wanglj. All rights reserved.
//

#import "customTabBarController.h"

@interface customTabBarController ()<UIActionSheetDelegate>

@end

@implementation customTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加首页
    UIViewController *homePageViewController = [[UIStoryboard storyboardWithName:@"homePageStoryboard" bundle:nil] instantiateInitialViewController];
    [self tabBarItemWithFrame:CGRectMake(0, 0, normalButtonWidth, tabBarHeight)
                   controller:homePageViewController
                        title:@"首页"
              normalImageName:@"首页"
            selectedImageName:@"首页-1"
               tabBarItemType:THTabBarItemNormal];
    
    //添加应用
    UIViewController *applicationViewController = [[UIStoryboard storyboardWithName:@"applicationStoryboard" bundle:nil] instantiateInitialViewController];
    [self tabBarItemWithFrame:CGRectMake(normalButtonWidth, 0, normalButtonWidth, tabBarHeight)
                   controller:applicationViewController
                        title:@"应用"
              normalImageName:@"应用"
            selectedImageName:@"应用-1"
               tabBarItemType:THTabBarItemNormal];
    //添加加号
    [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 2, 0, publishItemWidth, tabBarHeight)
                   controller:nil
                        title:@"加号"
              normalImageName:@"加号"
            selectedImageName:@"加号"
               tabBarItemType:THTabBarItemRise];
    
    //添加消息
    UIViewController *messageViewController = [[UIStoryboard storyboardWithName:@"messageStoryboard" bundle:nil] instantiateInitialViewController];
    [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 2 + publishItemWidth, 0, normalButtonWidth, tabBarHeight)
                   controller:messageViewController
                        title:@"消息"
              normalImageName:@"消息"
            selectedImageName:@"消息-1"
               tabBarItemType:THTabBarItemNormal];
    
    //添加我的
    UIViewController *myViewController = [[UIStoryboard storyboardWithName:@"MyStoryboard" bundle:nil] instantiateInitialViewController];
    [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 3 + publishItemWidth, 0, normalButtonWidth, tabBarHeight)
                   controller:myViewController
                        title:@"我的"
              normalImageName:@"我的"
            selectedImageName:@"我的-1"
               tabBarItemType:THTabBarItemNormal];
    
    // Do any additional setup after loading the view.
}
- (void)tabBarDidSelectedRiseButton{
    UIViewController *viewController = self.selectedViewController;
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册选取", @"其他", nil];
    [actionSheet showInView:viewController.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"buttonIndex = %ld", buttonIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
