//
//  SESearchResultsTest.m
//  SearchExample
//
//  Created by C.P. Lim on 23/10/11.
//  Copyright (c) 2011 C.P. Lim. All rights reserved.
//

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import "SESearchResultsTest.h"
#import "SESearchResults.h"
#import "ILCannedURLProtocol.h"

@interface SESearchResultsTest()
@property (nonatomic, retain) SESearchResults* results;
@end

@implementation SESearchResultsTest

@synthesize results;

- (void)setUp {
    [super setUp];
    
    results = [[SESearchResults alloc] initWithApiKey:@"apiKey"];
    
    [NSURLProtocol registerClass:[ILCannedURLProtocol class]];
	[ILCannedURLProtocol setCannedStatusCode:200];
	[ILCannedURLProtocol setCannedHeaders:nil];
	[ILCannedURLProtocol setCannedResponseData:nil];
	[ILCannedURLProtocol setCannedError:nil];
}

- (void)tearDown {
    [NSURLProtocol unregisterClass:[ILCannedURLProtocol class]];
	[ILCannedURLProtocol setCannedHeaders:nil];
	[ILCannedURLProtocol setCannedResponseData:nil];
	[ILCannedURLProtocol setCannedError:nil];
    
    [results release];
    
    [super tearDown];
}

- (NSData*) validResponseData {
    return [@"{\"results\":[{\"name\":\"name1\"},{\"name\":\"name2\"}], \"totalResults\":10}" dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSData*) invalidResponseData {
    return [@"{\"ok\":\"no\"}" dataUsingEncoding:NSUTF8StringEncoding];
}

- (void)testValidResponse {
    // given
    [ILCannedURLProtocol setCannedResponseData:[self validResponseData]];
    [results setSearchTerm:@"what"];
    [results setLocationTerm:@"where"];
    
    // when
    [results fetchRestulsForPage:1];

    // then
    expect(results.results.count).isGoing.toEqual(2);
    expect(results.results).toContain(@"name1");
    expect(results.results).toContain(@"name2");
}

- (void)testShouldAccumulateResultsWhenCallingSecondPage {
    // given
    [ILCannedURLProtocol setCannedResponseData:[self validResponseData]];
    NSArray* page1Results = [NSArray arrayWithObjects:@"nameX", @"nameY", nil];
    [results setResults:page1Results];
    [results setLocationTerm:@"where"];
    [results setSearchTerm:@"what"];
    [results setLocationTerm:@"where"];
    
    // when
    [results fetchRestulsForPage:2];
    
    // then
    expect(results.results.count).isGoing.toEqual(4);
    expect(results.results).toContain(@"nameX");
    expect(results.results).toContain(@"nameY");
    expect(results.results).toContain(@"name1");
    expect(results.results).toContain(@"name2");
}


- (void)testInvalidResponse {
    // given
    [ILCannedURLProtocol setCannedResponseData:[self invalidResponseData]];
    [results setSearchTerm:@"what"];
    [results setLocationTerm:@"where"];
    
    // when
    [results fetchRestulsForPage:1];
    
    // then
    expect(results.results.count).isGoing.toEqual(0);
}

- (void)testErrorResponse {
    // given
    NSError* error = [NSError errorWithDomain:NSURLErrorDomain code:kCFURLErrorTimedOut userInfo:nil];
    [ILCannedURLProtocol setCannedError:error];
    [results setSearchTerm:@"what"];
    [results setLocationTerm:@"where"];
    
    // when
    [results fetchRestulsForPage:1];
    
    // then
    expect([results.error code]).isGoing.toEqual([error code]);
    expect([results.error domain]).toEqual([error domain]);
}


@end
