#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNCuehallSnacksBillards : UIResponder

+ (instancetype)shared;
- (BOOL)cuehallSnacksBillards_joinThisWay:(void (^ __nullable)(void))changeVcBlock;
- (UIInterfaceOrientationMask)cuehallSnacksBillards_getOrientation;
- (UIViewController *)cuehallSnacksBillards_throughMainController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
