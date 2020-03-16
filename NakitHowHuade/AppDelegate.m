//
//  AppDelegate.m
//  NakitHowHuade
//
//  Created by admin on 16/3/2020.
//  Copyright © 2020 howhuade. All rights reserved.
//

#import "AppDelegate.h"
#import "NakitToolsHeader.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setNavigationBarColor];
    return YES;
}



-(void)setNavigationBarColor{
       [[UITabBar appearance] setTintColor:UIColorFromRGB( appColor)];
       [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(appColor)];
       [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
       [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: [UIColor whiteColor], NSForegroundColorAttributeName,[UIFont fontWithName:@"PingFang-SC-Medium" size: 20], NSFontAttributeName, nil]];
}
@end
