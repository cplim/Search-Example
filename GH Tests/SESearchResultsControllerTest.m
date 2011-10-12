//
//  SESearchResultsControllerTest.m
//  SearchExample
//
//  Created by C.P. Lim on 5/10/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <OCMock/OCMock.h>
#import <GHUnitIOS/GHUnit.h> 
#import "SESearchResultsControllerTest.h"

//@interface SESearchService(stubbed)
//- (void)useSuccess:(BOOL)successFlag;
//@end
//
//@implementation SESearchService(stubbed)
//
//- (void)searchBy:(id<SEQueryURL>)search {
//    if (self.successCallback != nil) {
//        self.successCallback(self.data);
//    }
//    if (self.failureCallback != nil) {
//        self.failureCallback(nil);
//    }
//}
//
//@end

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
//    id mockTableView = [OCMockObject niceMockForClass:[UITableView class]];
//    [[mockTableView expect] reloadData];
//    
//    searchResultsController.tableView = mockTableView;
    
    searchService.successCallback = ^(NSData* data) {
        [self notify:kGHUnitWaitStatusSuccess forSelector:@selector(testShouldPerformSearchAndDelegateResponseToController)];
    };
    [self prepare];
    
    searchResultsController.searchTerm = @"searchTerm";
    searchResultsController.locationTerm = @"locationTerm";
    searchResultsController.apiKey = @"apiKey";
    
    [searchResultsController search];
    
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:5.0];
//    
//    [mockTableView verify];
}

@end
