//
//  AppDelegate.m
//  AKTabBarController-BadgeValue
//
//  Created by doujingxuan on 13-12-4.
//  Copyright (c) 2013年 doujingxuan. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    FirstViewController * fvc = [[FirstViewController alloc] init];
    UINavigationController * nav1 = [[UINavigationController alloc] initWithRootViewController:fvc];
    
    SecondViewController * svc = [[SecondViewController alloc] init];
    UINavigationController * nav2 = [[UINavigationController alloc] initWithRootViewController:svc];

    ThirdViewController * tvc = [[ThirdViewController alloc] init];
    UINavigationController * nav3 = [[UINavigationController alloc] initWithRootViewController:tvc];

    FourthViewController * fovc = [[FourthViewController alloc] init];
    UINavigationController * nav4 = [[UINavigationController alloc] initWithRootViewController:fovc];

    self.akTabBarController = [[AKTabBarController alloc] initWithTabBarHeight:50 position:AKTabBarPositionBottom];
    
    [ self.akTabBarController setViewControllers:[NSMutableArray arrayWithObjects:nav1,nav2,nav3,nav4,nil]];
    
    // Below you will find an example of the possible customizations, just uncomment the lines belo
    
    // Tab background Image
    [self.akTabBarController setBackgroundImageName:@"noise-dark-gray.png"];
    [self.akTabBarController setSelectedBackgroundImageName:@"noise-dark-blue.png"];

    [self performSelector:@selector(test) withObject:nil afterDelay:3.0];
    [self performSelector:@selector(test2) withObject:nil afterDelay:5.0];
    [self performSelector:@selector(test3) withObject:nil afterDelay:7.0];
    
    self.window.rootViewController = self.akTabBarController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
-(void)test
{
    for (int i = 0; i <  self.akTabBarController.viewControllers.count; i++) {
        [ self.akTabBarController showBadgeAtIndex:i badgeValue:@"10"];
    }
    
}
-(void)test2
{
    for (int i = 0; i < self.akTabBarController.viewControllers.count; i++) {
        [ self.akTabBarController showBadgeAtIndex:i badgeValue:@"99+"];
    }
    
}
-(void)test3
{
    for (int i = 0; i <  self.akTabBarController.viewControllers.count; i++) {
        [ self.akTabBarController showBadgeAtIndex:i badgeValue:XFT_UPDateBadgeValue];
    }
}
-(void)test45
{
    [self.akTabBarController setSelectedIndex:0];
}


@end
