//
//  SearchController_iPhoneTest.m
//  SearchExample
//
//  Created by C.P. Lim on 20/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <OCMock/OCMock.h>
#import "SearchController_iPhoneTest.h"
#import "SESearchResultsController.h"

@implementation SearchController_iPhoneTest

- (void) setUp
{
    searchController = [[SearchController_iPhone alloc] initWithNibName:nil bundle:nil];
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
