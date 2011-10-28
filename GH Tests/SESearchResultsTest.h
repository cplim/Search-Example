//
//  SESearchResultsTest.h
//  SearchExample
//
//  Created by C.P. Lim on 23/10/11.
//  Copyright (c) 2011 C.P. Lim. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>

@interface SESearchResultsTest : GHTestCase
- (void)testValidResponse;
- (void)testInvalidResponse;
- (void)testErrorResponse;
@end
