//
//  AppDelegate.m
//  contatosip67
//
//  Created by ios6246 on 19/09/16.
//  Copyright © 2016 ios6246. All rights reserved.
//

#import "AppDelegate.h"
#import "ContactListViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIViewController* vc = [ContactListViewController new];
    UIScreen* screen = [UIScreen mainScreen];
    CGRect bounds = [screen bounds];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window = [[UIWindow alloc] initWithFrame:bounds];
    [self.window setRootViewController:nav];
    return YES;
}

@end
