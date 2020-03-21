//
//  AppDelegate+PUSH.h
//  copyguoguoaccount
//
//  Created by 海深 on 2019/1/17.
//  Copyright © 2019 fk. All rights reserved.
//

#import "AppDelegate.h"
#import "JPUSHService.h"
// iOS10 注册 APNs 所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (PUSH)<JPUSHRegisterDelegate>

- (void)BallSportPushregister:(NSDictionary*)option;

@end

NS_ASSUME_NONNULL_END
