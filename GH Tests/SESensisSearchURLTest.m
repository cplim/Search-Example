//
//  SESensisSearchURLTest.m
//  SearchExample
//
//  Created by C.P. Lim on 16/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import "SESensisSearchURLTest.h"

@implementation SESensisSearchURLTest

- (void) setUp {
    [super setUp];
    _sensisSearchURL = [[SESensisSearchURL alloc] initWithApiKey:@"some-api-key"];
}

- (void)tearDown {
    [_sensisSearchURL release];
    [super tearDown];
}

- (void)testShouldIncludeAPIKeyInRequestUrl {
    NSString* queryUrl = [_sensisSearchURL asQueryUrl];
    expect(queryUrl).toContain(@"key=some-api-key");
}

- (void) testShouldIncludeQueryInRequestUrlWhenSpecified {
    NSString* queryUrl = [[_sensisSearchURL searchFor:@"motor cars used"] asQueryUrl];
    expect(queryUrl).toContain(@"query=motor%20cars%20used");
}

- (void) testShouldNotIncludeQueryInRequestUrlWhenNotSpecified {
    NSString* queryUrl = [_sensisSearchURL asQueryUrl];
    expect(queryUrl).Not.toContain(@"query=");
}

- (void)testShouldIncludeLocationInRequestUrlWhenSpecified {
    NSString* queryUrl = [[_sensisSearchURL at:@"26 xyz road, suburb north"] asQueryUrl];
    expect(queryUrl).toContain(@"location=26%20xyz%20road,%20suburb%20north");
}

- (void)testShouldNotIncludeLocationInRequestUrlWhenNotSpecified {
    NSString* queryUrl = [_sensisSearchURL asQueryUrl];
    expect(queryUrl).Not.toContain(@"location=");
}

- (void)testShouldNotIncludePageNumberWhenPageIsOneOrLess {
    NSString* queryUrl = [[_sensisSearchURL onPage:1] asQueryUrl];
    expect(queryUrl).Not.toContain(@"page=");
}

- (void)testShouldIncludePageNumberWhenGreaterThanOne {
    NSString* queryUrl = [[_sensisSearchURL onPage:20] asQueryUrl];
    expect(queryUrl).toContain(@"page=20");
}

- (void)testShouldNotIncludeRowsWhenRowIsZeroOrLess {
    NSString* queryUrl = [[_sensisSearchURL withRows:0] asQueryUrl];
    expect(queryUrl).Not.toContain(@"rows=");
}

- (void)testShouldIncludeRowsWhenSpecified {
    NSString* queryUrl = [[_sensisSearchURL withRows:12] asQueryUrl];
    expect(queryUrl).toContain(@"rows=12");
}



@end
