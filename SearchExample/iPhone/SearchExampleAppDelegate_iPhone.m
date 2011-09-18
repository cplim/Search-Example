//
//  SearchExampleAppDelegate_iPhone.m
//  SearchExample
//
//  Created by C.P. Lim on 6/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SearchExampleAppDelegate_iPhone.h"
#import "SearchController_iPhone.h"

@implementation SearchExampleAppDelegate_iPhone

@synthesize navigationController;

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
//    NSLog(@"iphone app delegate");
//    UIViewController* rootController = [[SearchController_iPhone alloc] init];
//    navigationController = [[UINavigationController alloc] initWithRootViewController:rootController];
//    [rootController release];
//    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    [self.window addSubview:navigationController.view];
//    [self.window makeKeyAndVisible];
//    
//    return YES;
//}

-(void)applicationDidFinishLaunching:(UIApplication *)application
{
//    UIViewController* rootController = [[SearchController_iPhone alloc] init];
//    [rootController release];
    [self.window addSubview:navigationController.view];
    [self.window makeKeyAndVisible];
}

@end
