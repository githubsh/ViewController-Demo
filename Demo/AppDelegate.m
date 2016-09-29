//
//  AppDelegate.m
//  Demo
//
//  Created by 厘米科技 on 16/9/29.
//  Copyright © 2016年 厘米科技. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"

#import "LoginViewController.h"


@interface AppDelegate () <UITabBarControllerDelegate>

@property(nonatomic, strong) UIViewController *v1;
@property(nonatomic, strong) UIViewController *v2;
@property(nonatomic, strong) UIViewController *v3;
@property(nonatomic, strong) UIViewController *v4;

@property(nonatomic, strong) UINavigationController *nav1;
@property(nonatomic, strong) UINavigationController *nav2;
@property(nonatomic, strong) UINavigationController *nav3;
@property(nonatomic, strong) UINavigationController *nav4;

@end

@implementation AppDelegate

@synthesize rootTab;

@synthesize v1;
@synthesize v2;
@synthesize v3;
@synthesize v4;

@synthesize nav1;
@synthesize nav2;
@synthesize nav3;
@synthesize nav4;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    rootTab = [[UITabBarController alloc]init];
    rootTab.delegate = self;
    
    v1 = [[ViewController1 alloc]init];
    v2 = [[ViewController2 alloc]init];
    v3 = [[ViewController3 alloc]init];
    v4 = [[ViewController4 alloc]init];
    
    nav1 = [self addController:v1 title:@"首页" image:@"btm01" selectImage:@"btm011"];
    nav2 = [self addController:v2 title:@"找货" image:@"btm05" selectImage:@"btm055"];
    nav3 = [self addController:v3 title:@"购物车" image:@"btm03" selectImage:@"btm033"];
    nav4 = [self addController:v4 title:@"我" image:@"btm04" selectImage:@"btm044"];
    
    [rootTab addChildViewController:nav1];
    [rootTab addChildViewController:nav2];
    [rootTab addChildViewController:nav3];
    [rootTab addChildViewController:nav4];

    self.window.rootViewController = rootTab;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (UINavigationController *)addController:(UIViewController *)childViewController
                                    title:(NSString *)title
                                    image:(NSString *)image
                              selectImage:(NSString *)selectImage
{
    childViewController.title = title;
    
    childViewController.tabBarItem.image = [UIImage imageNamed:image];
    childViewController.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:childViewController];
    
    return navi;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (viewController == nav2) {
        
#define Logined 0
        
        if (Logined == 0){
            
            LoginViewController *login = [[LoginViewController alloc]init];
            UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:login];
            
            [viewController presentViewController:loginNav animated:YES completion:nil];
            
            return NO;
        }
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
