//
//  AppDelegate.m
//  NekiceHoluca
//
//  Created by nekice on 2020/3/12.
//  Copyright © 2020 NekiceHoluca. All rights reserved.
//

#import "AppDelegate.h"
#import "NekiceZhento.h"
#import "AppDelegate+PUSH.h"
#import <Firebase.h>
@interface AppDelegate ()

@end

@implementation AppDelegate



- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application stat
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
     [self BallSportPushregister:launchOptions];
     [self applicationTintColor];
     [FIRApp configure];
    return YES;
}

-(void)didRegisterLaunchPushWithKey:(NSString*)pushWithKey{
    
    UINavigationController *rootViewController = [[UINavigationController alloc]initWithRootViewController:[NekiceZhento new]];
    self.window.rootViewController = rootViewController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)applicationTintColor{
       [[UITabBar appearance] setTintColor:[UIColor colorWithRed:10/255.0 green:181/255.0 blue:159/255.0 alpha:1.0]];
       [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:10/255.0 green:181/255.0 blue:159/255.0 alpha:1.0]];
       [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
       [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor], NSForegroundColorAttributeName,[UIFont fontWithName:@"PingFang-SC-Medium" size: 20], NSFontAttributeName, nil]];
}
@end
