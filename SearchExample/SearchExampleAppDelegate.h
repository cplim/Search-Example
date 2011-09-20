//
//  SearchExampleAppDelegate.h
//  SearchExample
//
//  Created by C.P. Lim on 6/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchExampleAppDelegate : NSObject <UIApplicationDelegate>
{
    IBOutlet UINavigationController* navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController* navigationController;

@end
