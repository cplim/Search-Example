//
//  SESensisSearchURLTest.h
//  SearchExample
//
//  Created by C.P. Lim on 16/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <GHUnitIOS/GHTestCase.h>
#import "SESensisSearchURL.h"

@interface SESensisSearchURLTest : GHTestCase {
    SESensisSearchURL* _sensisSearchURL;
}
- (void)testShouldIncludeAPIKeyInRequestUrl;
- (void)testShouldIncludeQueryInRequestUrlWhenSpecified;
- (void)testShouldNotIncludeQueryInRequestUrlWhenNotSpecified;
- (void)testShouldIncludeLocationInRequestUrlWhenSpecified;
- (void)testShouldNotIncludeLocationInRequestUrlWhenNotSpecified;

@end
