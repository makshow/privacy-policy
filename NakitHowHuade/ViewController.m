//
//  ViewController.m
//  NakitHowHuade 
//
//  Created by admin on 16/3/2020.
//  Copyright © 2020 howhuade. All rights reserved.
//

#import "ViewController.h"
#import "NakitToolsHeader.h"

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
    
}



-(void)sheTap:(UITapGestureRecognizer *)tapImageView {
    UIImageView *sharImage = (UIImageView *)tapImageView.view;
    NSArray *activityItems = @[@"NakitHowHuade",sharImage.image,@""];
    UIActivityViewController *activityController=[[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
    activityController.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll];
    [self presentViewController:activityController animated:YES completion:nil];
}


@end
