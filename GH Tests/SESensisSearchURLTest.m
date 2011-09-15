//
//  SESensisSearchURLTest.m
//  SearchExample
//
//  Created by C.P. Lim on 16/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SESensisSearchURLTest.h"

@implementation SESensisSearchURLTest

- (void) setUp
{
    _sensisSearchURL = [[SESensisSearchURL alloc] initWithApiKey:@"some-api-key"];
}

- (void)tearDown
{
    [_sensisSearchURL release];
}

- (void)testShouldIncludeAPIKeyInRequestUrl
{
    NSString* queryUrl = [_sensisSearchURL asQueryUrl];
    GHAssertTrue([queryUrl rangeOfString:@"key=some-api-key"].location != NSNotFound, @"Failed to include key in url");
}

- (void) testShouldIncludeQueryInRequestUrlWhenSpecified
{
    NSString* queryUrl = [[_sensisSearchURL searchFor:@"motor cars used"] asQueryUrl];
    GHAssertTrue([queryUrl rangeOfString:@"query=motor%20cars%20used"].location != NSNotFound, @"Failed to include query in url");
}

- (void) testShouldNotIncludeQueryInRequestUrlWhenNotSpecified
{
    NSString* queryUrl = [_sensisSearchURL asQueryUrl];
    GHAssertTrue([queryUrl rangeOfString:@"query="].location == NSNotFound, @"Should not include query in url");
}

- (void)testShouldIncludeLocationInRequestUrlWhenSpecified
{
    NSString* queryUrl = [[_sensisSearchURL at:@"26 xyz road, suburb north"] asQueryUrl];
    GHAssertTrue([queryUrl rangeOfString:@"location=26%20xyz%20road,%20suburb%20north"].location != NSNotFound, @"Failed to include location in url");
}

- (void)testShouldNotIncludeLocationInRequestUrlWhenNotSpecified
{
    NSString* queryUrl = [_sensisSearchURL asQueryUrl];
    GHAssertTrue([queryUrl rangeOfString:@"location="].location == NSNotFound, @"Should not include location in url");
}

@end
