//
//  SESensisResultsSummaryTest.m
//  SearchExample
//
//  Created by C.P. Lim on 30/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SESensisResultsSummaryTest.h"

@implementation SESensisResultsSummaryTest

- (void) testShouldReturnCountFromJsonData
{
    NSDictionary* jsonData = [NSDictionary dictionaryWithObject:@"10" forKey:@"count"];
    SESensisResultsSummary* searchResults = [SESensisResultsSummary searchResultsWithJsonData:jsonData];
    GHAssertEquals(searchResults.count, 10, @"Current count does not equal expected");
}

- (void) testShouldReturnCurrentPageFromJsonData
{
    NSDictionary* jsonData = [NSDictionary dictionaryWithObject:@"1" forKey:@"currentPage"];
    SESensisResultsSummary* searchResults = [SESensisResultsSummary searchResultsWithJsonData:jsonData];
    GHAssertEquals(searchResults.currentPage, 1, @"Current page does not equal expected");
}

- (void) testShouldReturnTotalResultsFromJsonData
{
    NSDictionary* jsonData = [NSDictionary dictionaryWithObject:@"3" forKey:@"totalResults"];
    SESensisResultsSummary* searchResults = [SESensisResultsSummary searchResultsWithJsonData:jsonData];
    GHAssertEquals(searchResults.totalResults, 3, @"Total results does not equal expected");
}

- (void) testShouldReturnTotalPagesFromJsonData
{
    NSDictionary* jsonData = [NSDictionary dictionaryWithObject:@"123" forKey:@"totalPages"];
    SESensisResultsSummary* searchResults = [SESensisResultsSummary searchResultsWithJsonData:jsonData];
    GHAssertEquals(searchResults.totalPages, 123, @"Total pages does not equal expected");
}

- (void) testShouldReturnSuccessWhenCodeIs200Or206
{
    NSDictionary* jsonData = [NSDictionary dictionaryWithObject:@"200" forKey:@"code"];
    SESensisResultsSummary* searchResults = [SESensisResultsSummary searchResultsWithJsonData:jsonData];
    GHAssertTrue(searchResults.success, @"Expected success for code 200");

    jsonData = [NSDictionary dictionaryWithObject:@"206" forKey:@"code"];
    searchResults = [SESensisResultsSummary searchResultsWithJsonData:jsonData];
    GHAssertTrue(searchResults.success, @"Expected success for code 206");
}

- (void) testShouldNotReturnSuccessWhenCodeIs400
{
    NSDictionary* jsonData = [NSDictionary dictionaryWithObject:@"400" forKey:@"code"];
    SESensisResultsSummary* searchResults = [SESensisResultsSummary searchResultsWithJsonData:jsonData];
    GHAssertFalse(searchResults.success, @"Expected failure for code 400");
}

@end
