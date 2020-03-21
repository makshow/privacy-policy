//
//  NekiceZhento.m
//  NekiceHoluca
//
//  Created by nekice on 2020/3/12.
//  Copyright © 2020 NekiceHoluca. All rights reserved.
//  

#import "HolucaLoxia.h"
#import "NekiceZhento.h"





@interface NekiceZhento ()
@property (weak, nonatomic) IBOutlet UICollectionView *nekiceZhento;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nekiceTT;
@end

@implementation NekiceZhento


/*
#pragma mark - Navigation
//https://sweetcandy.w.eolinker.com/#/home/ams/project/inside/api/list?groupID=-1&projectHashKey=v6CRCcTde0e0448976e4f45e4c03b5dfc1ec40290d21629&spaceKey=sweetcandy
//https://www.leancloud.cn success
 //https://mockapi.eolinker.com/v6CRCcTde0e0448976e4f45e4c03b5dfc1ec40290d21629/api/index/const
 //f2tg8592
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HolucaLoxia *nekice  = [collectionView dequeueReusableCellWithReuseIdentifier:@"HolucaLoxia" forIndexPath:indexPath];
    
    
    nekice.holucaLoxia.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",indexPath.item + 1]];
    [nekice.holucaLoxia addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(holucaLoxia:)]];
    
    nekice.holucaLoxia.userInteractionEnabled = YES;
    
    return nekice;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return  CGSizeMake([UIScreen mainScreen].bounds.size.width/3.22316 ,[UIScreen mainScreen].bounds.size.width/3.22316);
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

-(void)holucaLoxia:(UITapGestureRecognizer *)holucaLoxia {
    UIImageView *nekice = (UIImageView *)holucaLoxia.view;
    NSArray *activityItems = @[@"Nekice Holuca",nekice.image,@""];
    UIActivityViewController *activityController=[[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
    activityController.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll];
    [self presentViewController:activityController animated:YES completion:nil];
}


-(CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return  CGSizeMake(0, 0);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.nekiceZhento registerNib:[UINib nibWithNibName:@"HolucaLoxia" bundle:nil] forCellWithReuseIdentifier:@"HolucaLoxia"];

    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"Nekice Holuca";
    
//    self.nekiceTT.constant = ([UIScreen mainScreen].bounds.size.height > 755 ? 86:64);
//    
//    
//    UIView *nekice = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, ([UIScreen mainScreen].bounds.size.height > 755 ? 87:63.5))];
//    
//    UILabel *holuca = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, ([UIScreen mainScreen].bounds.size.height > 755 ? 77:40))];
//
//    holuca.font = [UIFont systemFontOfSize:23];
//
//    holuca.text = @"Nekice Holuca";
//    nekice.backgroundColor = [UIColor colorWithRed:10/255.0 green:181/255.0 blue:159/255.0 alpha:1.0];
//    
//    [nekice addSubview:holuca];
//    holuca.textAlignment = NSTextAlignmentCenter;
//
//    [self.view addSubview:nekice];
//    holuca.textColor = [UIColor whiteColor];

    
 
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *nekice = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"nekice" forIndexPath:indexPath];
    return nekice;
}
@end
