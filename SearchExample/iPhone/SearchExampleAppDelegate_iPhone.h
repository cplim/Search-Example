//
//  SearchExampleAppDelegate_iPhone.h
//  SearchExample
//
//  Created by C.P. Lim on 6/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SearchExampleAppDelegate.h"

@interface SearchExampleAppDelegate_iPhone : SearchExampleAppDelegate
{
    IBOutlet UINavigationController* navigationController;
}

@property (nonatomic, retain) IBOutlet UINavigationController* navigationController;
@end
