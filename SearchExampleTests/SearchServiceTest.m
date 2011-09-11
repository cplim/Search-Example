//
//  SearchServiceTest.m
//  SearchExample
//
//  Created by C.P. Lim on 11/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SearchServiceTest.h"

@implementation SearchServiceTest

- (void)setUp
{
    [super setUp];
    searchService = [[SearchService alloc] initWithApiKey:@"apiKey"];
}

- (void)tearDown
{
    [searchService release];
    [super tearDown];
}

- (void)testShouldIncludeAPIKeyInRequestUrl 
{
    NSString* queryUrl = [searchService queryUrl:nil location:nil];
    STAssertTrue([queryUrl rangeOfString:@"key=apiKey"].location != NSNotFound, @"Failed to include apikey in url");
}

- (void) testShouldIncludeQueryInRequestUrl
{
    NSString* queryUrl = [searchService queryUrl:@"motor cars used" location:nil];
    STAssertTrue([queryUrl rangeOfString:@"query=motor%20cars%20used"].location != NSNotFound, @"Failed to include query in url");
}

- (void)testShouldIncludeLocationInRequestUrl
{
    NSString* queryUrl = [searchService queryUrl:nil location:@"26 xyz road, suburb north"];
    STAssertTrue([queryUrl rangeOfString:@"location=26%20xyz%20road,%20suburb%20north"].location != NSNotFound, @"Failed to include location in url");
}

@end
