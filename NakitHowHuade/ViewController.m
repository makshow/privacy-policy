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
    
    UIImageView *imgView = [[UIImageView alloc] init];
       imgView.contentMode =     UIViewContentModeScaleAspectFill;
       imgView.image = [UIImage imageNamed:@"launch"];
       imgView.frame = [UIScreen mainScreen].bounds;
       [self.view addSubview:imgView];
    
    UIScrollView *PEHIVURSheSC = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , SCREEN_HEIGHT)];
    PEHIVURSheSC.contentSize = CGSizeMake(PEHIVURSheSC.frame.size.width,PEHIVURSheSC.frame.size.height + 1);
    PEHIVURSheSC.backgroundColor = [UIColor clearColor];
    PEHIVURSheSC.showsVerticalScrollIndicator = NO;
    [self.view addSubview:PEHIVURSheSC];
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"animal.plist" ofType:nil];
    NSArray *a = [[NSArray alloc]initWithContentsOfFile:filePath];
    NSMutableArray*dataSource = [NSMutableArray array];
    
    for (NSDictionary *dic in a) {
            NSString *name = dic[@"name"];
               
        [dataSource addObject:name];
               //NSString *fileName = [NSString stringWithFormat:@"%@@2x.png",name];
            
    }
    
    
      NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"resources" ofType:@"bundle"];
    
    for (NSInteger i = 0; i < dataSource.count; i++) {
        UIImageView *PEHIVURSheIV = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/3 * (i%3), [UIScreen mainScreen].bounds.size.width/3 * (i/3), [UIScreen mainScreen].bounds.size.width/3 , [UIScreen mainScreen].bounds.size.width/3 )];

         
        NSLog(@"=====================%@",dataSource[i]);
        
          NSString *name = dataSource[i];

         NSString *fileName = [[bundlePath stringByAppendingPathComponent:@"animal"] stringByAppendingPathComponent:name];
         [PEHIVURSheIV setImage:[UIImage imageWithContentsOfFile:fileName]];
        [PEHIVURSheSC addSubview:PEHIVURSheIV];
        PEHIVURSheIV.tag = i;
        PEHIVURSheIV.userInteractionEnabled = YES;
       // [PEHIVURSheIV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(PEHIVURSheTap:)]];
        
        if (PEHIVURSheIV.frame.origin.y + PEHIVURSheIV.frame.size.height > PEHIVURSheSC.contentSize.height) {
            PEHIVURSheSC.contentSize = CGSizeMake(PEHIVURSheSC.frame.size.width,PEHIVURSheIV.frame.origin.y + PEHIVURSheIV.frame.size.height + 1);
        }
    }
}


@end
