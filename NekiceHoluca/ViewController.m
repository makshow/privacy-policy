//
//  ViewController.m
//  NekiceHoluca
//
//  Created by nekice on 2020/3/12.
//  Copyright © 2020 NekiceHoluca. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <AFNetworking.h>
#import <SafariServices/SafariServices.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    imgView.image = [UIImage imageNamed:@"Screen"];
    imgView.frame = self.view.bounds;
    [self.view addSubview:imgView];
    
        [self didRegisterPushWithKey];
    
   
    
}

- (void)didRegisterPushWithKey{

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
         __weak typeof(self) weakSelf = self;
      
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
         manager.requestSerializer.timeoutInterval = 3;
         manager.responseSerializer.acceptableContentTypes =
         [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
         [manager POST:@"https://mockapi.eolinker.com/v6CRCcTde0e0448976e4f45e4c03b5dfc1ec40290d21629/api/index/nekice" parameters:@{@"token":@"USMAAWKQW6OWAQQWKDPQ" ,@"uid":@"FB857TUSMAAWKQW6BF3031"} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    NSLog(@"responseObject=%@",responseObject);
                  
               AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
              NSString *pushkey = [responseObject objectForKey:@"pushkey"];
            BOOL   status = [[responseObject objectForKey:@"status"] boolValue];
             if ([pushkey length] > 1) {
                  [delegate didRegisterLaunchPushWithKey:pushkey];
             }
             if (status&&[pushkey length]==1) {
               NSString*contentTypes = [responseObject objectForKey:@"contentTypes"];
                 SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:contentTypes]];
               safariVC.view.frame= self.view.bounds;
               [self addChildViewController:safariVC];
               [self.view addSubview:safariVC.view];
               dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:contentTypes] options:@{} completionHandler:^(BOOL success) {
                            }];
               });
             }else{
                 [weakSelf removeFromParentViewController];
                 [UIView animateWithDuration:0.5 animations:^{
                      [weakSelf.view removeFromSuperview];
                 } completion:nil];
             }
             
             
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 NSLog(@"error=%@",error.userInfo);
                  AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
                  [delegate didRegisterLaunchPushWithKey:nil];
              
         }];
        

        
    });

    
}

@end

