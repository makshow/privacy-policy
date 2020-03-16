//
//  NakitToolsHeader.h
//  NakitHowHuade
//
//  Created by admin on 16/3/2020.
//  Copyright © 2020 howhuade. All rights reserved.
//

#ifndef NakitToolsHeader_h
#define NakitToolsHeader_h

#define APP_ID @"BfhCX7hNFtkQ0DlW79M5kEqp-gzGzoHsz"
#define APP_KEY @"cXIinf17uf4G1he7tSxzPzwb"
#define API_URL @"https://bfhcx7hn.lc-cn-n1-shared.com"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define BarHight \
({\
CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];\
CGRect rectNav = self.navigationController.navigationBar.frame;\
( rectStatus.size.height+ rectNav.size.height);\
})\


typedef NS_ENUM(UInt32, UIColorRGB) {
       appColor         = 0x78B910

};

#endif /* NakitToolsHeader_h */
