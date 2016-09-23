//
//  AppDelegate.m
//  contatosip67
//
//  Created by ios6246 on 19/09/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import "AppDelegate.h"
#import "ContactListViewController.h"
#import "ContactsMapViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    UIViewController* mapVC = [ContactsMapViewController new];
    UINavigationController* mapNav = [[UINavigationController alloc] initWithRootViewController:mapVC];
    
    UIViewController* listVC = [ContactListViewController new];
    UINavigationController* listNav = [[UINavigationController alloc] initWithRootViewController:listVC];

    UITabBarController* tabs = [UITabBarController new];
    tabs.viewControllers = @[listNav, mapNav];

    UIScreen* screen = [UIScreen mainScreen];
    CGRect bounds = [screen bounds];
    self.window = [[UIWindow alloc] initWithFrame:bounds];
    [self.window setRootViewController:tabs];
    
    return YES;
}

@end
