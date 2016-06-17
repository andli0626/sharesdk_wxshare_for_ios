//
//  AppDelegate.m
//  ShareSDk_WX
//
//  Created by 李林 on 16/6/16.
//  Copyright © 2016年 李林. All rights reserved.
//

#import "AppDelegate.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>

//微信SDK头文件
#import "WXApi.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 从sharesdk平台获取
    NSString *sharesdkAppKey = @"";
    
    #pragma mark 隐藏“微信收藏”平台
    // 不要使用微信总平台进行初始化
    // @(SSDKPlatformTypeWechat),
    // 使用微信子平台进行初始化，即可
    // @(SSDKPlatformSubTypeWechatSession),
    // @(SSDKPlatformSubTypeWechatTimeline),
    
    [ShareSDK registerApp:sharesdkAppKey
          activePlatforms:@[@(SSDKPlatformSubTypeWechatSession),@(SSDKPlatformSubTypeWechatTimeline)]
                 onImport:^(SSDKPlatformType platformType)
     {
         switch (platformType)
         {
             case SSDKPlatformTypeWechat:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             default:
                 break;
         }
     }
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo)
     {
         
         switch (platformType)
         {
                 
             case SSDKPlatformTypeWechat:
                 // 从微信开放平台获取 AppID，AppSecret
                 [appInfo SSDKSetupWeChatByAppId:@""
                                       appSecret:@""];
                 break;
             default:
                 break;
         }
     }];
    return YES;
}

-(void)onResp:(BaseResp *)resp
{
    NSLog(@"The response of wechat.");
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
