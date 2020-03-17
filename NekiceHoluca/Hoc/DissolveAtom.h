

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DissolveAtom : NSObject

+ (void)showAlertViewWithTitle:(NSString *)title
                   withMessage:(NSString *)message
               withActionTitle:(NSString *)actionTitle
              withActionMothed:(void (^)(void))actionMothed
               withCancelTitle:(NSString *)cancelTitle
              withCancelMothed:(void (^)(void))cancelMothed
            withViewController:(UIViewController *)viewController;

+ (void)showAlertFile;

@end




