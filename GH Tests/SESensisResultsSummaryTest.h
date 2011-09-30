//
//  SESensisResultsSummaryTest.h
//  SearchExample
//
//  Created by C.P. Lim on 30/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <GHUnitIOS/GHTestCase.h>
#import "SESensisResultsSummary.h"

@interface SESensisResultsSummaryTest : GHTestCase

- (void) testShouldReturnCountFromJsonData;
- (void) testShouldReturnCurrentPageFromJsonData;
- (void) testShouldReturnTotalResultsFromJsonData;
- (void) testShouldReturnTotalPagesFromJsonData;
- (void) testShouldReturnSuccessWhenCodeIs200Or206;
- (void) testShouldNotReturnSuccessWhenCodeIs400;

@end
