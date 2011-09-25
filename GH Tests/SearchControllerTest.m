//
//  SearchControllerTest.m
//  SearchExample
//
//  Created by C.P. Lim on 20/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <OCMock/OCMock.h>
#import "SearchControllerTest.h"

//@interface SearchController(private)
//-(id)initWithSearchService:(SESearchService*)searchService;
//@end
//
//@implementation SearchController(private)
//-(id)initWithSearchService:(SESearchService*)searchService
//{
//    self = [super initWithNibName:nil bundle:nil];
//    if (self) {
//        _searchService = [searchService retain];
//    }
//    return self;
//
//}
//
//- (void)dealloc
//{
//    [_searchService release];
//    [super release];
//}
//@end

@implementation SearchControllerTest

- (void) setUp
{
    mockSearchService = [OCMockObject mockForClass:[SESearchService class]];
//    _searchController = [[SearchController alloc] initWithSearchService:_mockSearchService];
    NSBundle* bundle = [[NSBundle alloc] init];
    
    searchController = [[SearchController alloc] initWithNibName:nil bundle:bundle];
    searchController.searchService = mockSearchService;
}

- (void)tearDown
{
    [searchController release];
}

- (void)testShouldDelegateToSearchServiceWhenSearchIsInvoked
{
    id mockDelegate = [OCMockObject mockForClass:[NSObject class]];
    [[mockSearchService expect] searchBy:[OCMArg any] delegate:mockDelegate];
    id whatField = [OCMockObject mockForClass:[UITextField class]];
    [[[whatField stub] andReturn:@"what"] text];
    id whereField = [OCMockObject mockForClass:[UITextField class]];
    [[[whereField stub] andReturn:@"where"] text];
    
    searchController.whatField = whatField;
    searchController.whereField = whereField;
    
    [searchController search:nil];
}


@end
