//
//  AppDelegate.m
//  FlutterObjcDemo
//
//  Created by Marshal on 2022/4/15.
//

#import "AppDelegate.h"
#import <Flutter/Flutter.h>

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    FlutterViewController *vc = [[FlutterViewController alloc] initWithProject:nil initialRoute:@"one" nibName:nil bundle:nil];;
    
    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];
    
    FlutterMethodChannel * methodChannel =  [FlutterMethodChannel methodChannelWithName:@"one_page" binaryMessenger:vc];
    
    [methodChannel invokeMethod:@"one" arguments:nil];
    
    //监听退出
    [methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        NSLog(@"ios回调 %@ -- %@", call.method, call.arguments);
    }];
    
    return YES;
}


@end
