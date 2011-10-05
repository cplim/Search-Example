//
//  SESearchResultsControllerTest.h
//  SearchExample
//
//  Created by C.P. Lim on 5/10/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <GHUnitIOS/GHTestCase.h>
#import "SESearchResultsController.h"
#import "SESearchService.h"

@interface SESearchResultsControllerTest : GHTestCase {
    SESearchResultsController* searchResultsController;
    SESearchService* searchService;
}
- (void)testShouldPerformSearchAndDelegateResponseToController;
@end
