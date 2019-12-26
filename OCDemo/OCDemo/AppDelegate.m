//
//  AppDelegate.m
//  OCDemo
//
//  Created by 千阳 on 2019/11/29.
//  Copyright © 2019 千阳. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "NativeViewController.h"

@interface AppDelegate ()
@property(nonatomic,strong)UITabBarController *tabVC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    self.tabVC = [[UITabBarController alloc]init];
    NativeViewController *vc1 = [[NativeViewController alloc] init];
    vc1.tabBarItem.title = @"v1";
    vc1.title = @"v1";
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    
    ViewController *viewController = [ViewController shareInstance];
    viewController.tabBarItem.title = @"v2";
    viewController.title = @"v2";
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:viewController];

    [self.tabVC addChildViewController:nav1] ;
    [self.tabVC addChildViewController:nav2];
    
    self.tabVC.tabBarController.selectedIndex = 0;
    
    self.window.rootViewController = self.tabVC;
    [self.window makeKeyWindow];
    return YES;
}

-(int)testMethod
{
    NSLog(@"what are you 弄啥嘞～");
    return 1;
}

#pragma mark - UISceneSession lifecycle

//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
