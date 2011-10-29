//
//  SearchControllerTest.m
//  SearchExample
//
//  Created by C.P. Lim on 20/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <OCMock/OCMock.h>
#import "SearchControllerTest.h"
#import "SESearchResultsController.h"

@implementation SearchControllerTest

- (void) setUp
{
    mockSearchService = [OCMockObject mockForClass:[SESearchService class]];
    id bundle = [OCMockObject mockForClass:[NSBundle class]];
    
    searchController = [[SearchController alloc] initWithNibName:nil bundle:bundle];
}

- (void)tearDown
{
    [searchController release];
}

-(void)testShouldDelegateToNextControllerWithSearchResults
{
    id mockWhatField = [OCMockObject mockForClass:[UITextField class]];
    [[[mockWhatField expect] andReturn:@"what"] text];
    id mockWhereField = [OCMockObject mockForClass:[UITextField class]];
    [[[mockWhereField expect] andReturn:@"where"] text];
    
    searchController.whatField = mockWhatField;
    searchController.whereField = mockWhereField;
    
    [searchController search:nil];
    
    [searchController.navigationController.topViewController isKindOfClass:[SESearchResultsController class]];
    
    [mockWhatField verify];
    [mockWhereField verify];
}


@end
