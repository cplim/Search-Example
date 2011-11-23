//
//  SESearchResultsTest.h
//  SearchExample
//
//  Created by C.P. Lim on 23/10/11.
//  Copyright (c) 2011 C.P. Lim. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>

@interface SESearchResultsTest : GHTestCase
- (void)testInvalidResponse;
- (void)testErrorResponse;
- (void)testShouldReturnTotalResultsCount;
- (void)testShouldReturnPageOne;
- (void)testShouldReturnPageTwo;
- (void)testShouldReturnResultsArray;
- (void)testShouldAccumulateResultsWhenCallingSecondPage;
- (void)testShouldNotFetchDataWhenOffsetAlreadyContainsData;
- (void)testShouldVerifyArgumentsPassedToQueryBuilder;
@end
