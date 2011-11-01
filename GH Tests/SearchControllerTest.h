//
//  SearchControllerTest.h
//  SearchExample
//
//  Created by C.P. Lim on 20/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "SearchController.h"

@interface SearchControllerTest : GHTestCase
{
    SearchController* searchController;
    id mockSearchService;
}
-(void)testShouldDelegateToNextControllerWithSearchResults;
@end
