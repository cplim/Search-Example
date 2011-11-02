//
//  SESearchResultsControllerTest.m
//  SearchExample
//
//  Created by C.P. Lim on 5/10/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import "SESearchResultsControllerTest.h"
#import "SESearchResults.h"

@implementation SESearchResultsControllerTest

- (void)testShouldReturnTotalNumberOfRowsInSection {
    SESearchResults* searchResults = [[SESearchResults alloc] initWithQueryBuilderFactory:nil];
    NSArray* results = [NSArray arrayWithObjects:@"one", @"two", @"three", nil];
    [searchResults setResults:results];
    SESearchResultsController* searchResultsController = [[SESearchResultsController alloc] initWithSearchResults:searchResults];
    
    expect([searchResultsController numberOfSectionsInTableView:searchResultsController.tableView]).toEqual(1);
    expect([searchResultsController tableView:[searchResultsController tableView] numberOfRowsInSection:1]).toEqual(results.count);
}

@end
