//
//  SearchControllerTest.m
//  SearchExample
//
//  Created by C.P. Lim on 20/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <OCMock/OCMock.h>
#import "SearchControllerTest.h"

@implementation SearchControllerTest

- (void) setUp
{
    mockSearchService = [OCMockObject mockForClass:[SESearchService class]];
    id bundle = [OCMockObject mockForClass:[NSBundle class]];
    
    searchController = [[SearchController alloc] initWithNibName:nil bundle:bundle];
    searchController.searchService = mockSearchService;
}

- (void)tearDown
{
    [searchController release];
}

- (void)testShouldDelegateToSearchServiceWhenSearchIsInvoked
{
    [[mockSearchService expect] searchBy:[OCMArg isNotNil] delegate:nil];
    id mockWhatField = [OCMockObject mockForClass:[UITextField class]];
    [[[mockWhatField expect] andReturn:@"what"] text];
    id mockWhereField = [OCMockObject mockForClass:[UITextField class]];
    [[[mockWhereField expect] andReturn:@"where"] text];
    
    searchController.whatField = mockWhatField;
    searchController.whereField = mockWhereField;
    searchController.apiKey = @"apiKey";
    
    [searchController search:nil];
    
    [mockWhatField verify];
    [mockWhereField verify];
    [mockSearchService verify];
}


@end
