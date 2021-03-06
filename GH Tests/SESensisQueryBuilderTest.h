//
//  SESensisQueryBuilderTest.h
//  SearchExample
//
//  Created by C.P. Lim on 16/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <GHUnitIOS/GHTestCase.h>
#import "SESensisQueryBuilder.h"

@interface SESensisQueryBuilderTest : GHTestCase {
    SESensisQueryBuilder* _sensisQueryBuilder;
}
- (void)testShouldIncludeAPIKeyInRequestUrl;
- (void)testShouldIncludeQueryInRequestUrlWhenSpecified;
- (void)testShouldNotIncludeQueryInRequestUrlWhenNotSpecified;
- (void)testShouldIncludeLocationInRequestUrlWhenSpecified;
- (void)testShouldNotIncludeLocationInRequestUrlWhenNotSpecified;
- (void)testShouldNotIncludePageNumberWhenPageIsOneOrLess;
- (void)testShouldIncludePageNumberWhenGreaterThanOne;
- (void)testShouldNotIncludeRowsWhenRowIsZeroOrLess;
- (void)testShouldIncludeRowsWhenSpecified;

@end
