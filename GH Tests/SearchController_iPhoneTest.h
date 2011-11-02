//
//  SearchController_iPhoneTest.h
//  SearchExample
//
//  Created by C.P. Lim on 20/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "SearchController_iPhone.h"

@interface SearchController_iPhoneTest : GHTestCase {
    SearchController_iPhone* searchController;
}
-(void)testShouldDelegateToNextControllerWithSearchResults;
@end
