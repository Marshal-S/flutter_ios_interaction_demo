//
//  AppDelegate.m
//  FlutterObjcDemo
//
//  Created by Marshal on 2022/4/15.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (nonatomic, strong) FlutterMethodChannel *methodChannel;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    FlutterViewController *vc = [[FlutterViewController alloc] initWithProject:nil initialRoute:@"one" nibName:nil bundle:nil];
    
    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];
    
    self.methodChannel =  [FlutterMethodChannel methodChannelWithName:@"one_page" binaryMessenger:vc];
    
    [self.methodChannel invokeMethod:@"one" arguments:nil result:^(id  _Nullable result) {
        
    }];
    
    //监听退出
    [self.methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        NSLog(@"ios回调 %@ -- %@", call.method, call.arguments);
        //如果交互过程出现了问题，可以调用 result回调，将内容回调给 flutter端
    }];
    
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}


@end
