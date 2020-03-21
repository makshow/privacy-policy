//
//  AppDelegate.m
//  NekiceHoluca
//
//  Created by nekice on 2020/3/12.
//  Copyright © 2020 NekiceHoluca. All rights reserved.
//

#import "AppDelegate.h"
#import "NekiceZhento.h"

@interface AppDelegate ()

@end

@implementation AppDelegate



- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application stat
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(void)didRegisterLaunchPushWithKey:(NSString*)pushWithKey{

    self.window.rootViewController = [[NekiceZhento alloc]init];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
