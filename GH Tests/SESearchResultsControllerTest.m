//
//  SESearchResultsControllerTest.m
//  SearchExample
//
//  Created by C.P. Lim on 5/10/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <OCMock/OCMock.h>
#import "SESearchResultsControllerTest.h"
#import "SESearchResults.h"

@implementation SESearchResultsControllerTest

- (void)testShouldReturnTotalNumberOfRowsInSection {
    SESearchResults* searchResults = [[SESearchResults alloc] initWithSearchService:nil];
    searchResults.totalResults = 3;
    SESearchResultsController* searchResultsController = [[SESearchResultsController alloc] initWithSearchResults:searchResults];
    
    GHAssertEquals(1, [searchResultsController numberOfSectionsInTableView:searchResultsController.tableView], @"Expected number of sections to be 1");
    GHAssertEquals(searchResults.totalResults, [searchResultsController tableView:[searchResultsController tableView] numberOfRowsInSection:1], @"Total results doesn't match number of ");
}

@end
