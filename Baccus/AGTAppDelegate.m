//
//  AGTAppDelegate.m
//  Baccus
//
//  Created by Enrique Escribano on 03/12/13.
//  Copyright (c) 2013 Enrique Escribano. All rights reserved.
//

#import "AGTAppDelegate.h"
#import "AGTWineModel.h"
#import "AGTWineViewController.h"
#import "AGTWebViewController.h"
#import "AGTWineryModel.h"
#import "AGTWineryTableViewController.h"

@implementation AGTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Creamos el modelo
    AGTWineryModel *winery = [[AGTWineryModel alloc] init];
    
    // Creamos los controladores
    AGTWineryTableViewController *wineryVC = [[ AGTWineryTableViewController alloc] initWithModel:winery style:UITableViewStylePlain];
    
    AGTWineViewController *wineVC = [[AGTWineViewController alloc] initWithModel:[winery redWineAtIndex:0]];
    
    // Creamos los navigation
    UINavigationController *wineryNav = [[UINavigationController alloc] initWithRootViewController:wineryVC];
    
    UINavigationController *wineNav = [[UINavigationController alloc] initWithRootViewController:wineVC];
    //Creamos el combinador: SplitView
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    
    splitVC.viewControllers = @[wineryNav, wineNav];
    
    //Asignamos delegados
    splitVC.delegate = wineVC;
    wineryVC.delegate = wineVC;
    
    //Lo asignamos como controlador raiz
    self.window.rootViewController = splitVC;

   
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor orangeColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
