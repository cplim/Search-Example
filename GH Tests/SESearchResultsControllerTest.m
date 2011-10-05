//
//  SESearchResultsControllerTest.m
//  SearchExample
//
//  Created by C.P. Lim on 5/10/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <OCMock/OCMock.h>
#import "SESearchResultsControllerTest.h"

//@interface SESearchService(stubbed)
//- (void)searchBy:(id<SEQueryURL>)search;
//@end
//
@implementation SESearchService(stubbed)

- (void)searchBy:(id<SEQueryURL>)search {
//    self.completed = YES;
}

@end

@implementation SESearchResultsControllerTest

- (void)setUp {
    [super setUp];
    searchResultsController = [[SESearchResultsController alloc] init];
    searchService = [[SESearchService alloc] init];
    searchResultsController.searchService = searchService;
}

- (void)tearDown {
    [searchResultsController release];
    [searchService release];
    [super tearDown];
}

- (void)testShouldPerformSearchAndDelegateResponseToController {
    id mockTableView = [OCMockObject niceMockForClass:[UITableView class]];
    [[mockTableView expect] reloadData];
    searchResultsController.tableView = mockTableView;
    
    searchResultsController.searchTerm = @"searchTerm";
    searchResultsController.locationTerm = @"locationTerm";
    searchResultsController.apiKey = @"apiKey";
    
    [searchResultsController search];
    searchService.completed = YES;
    
    [mockTableView verify];
}

@end
