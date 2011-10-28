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
    
    SESearchService* searchService = [[SESearchService alloc] init];
    results = [[SESearchResults alloc] initWithSearchService:searchService apiKey:@"apiKey"];
    [searchService release];
    
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
    return [@"{\"results\":[{\"name\":\"name1\"},{\"name\":\"name2\"}], \"totalResults\":2}" dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSData*) invalidResponseData {
    return [@"{\"ok\":\"no\"}" dataUsingEncoding:NSUTF8StringEncoding];
}

- (void)testValidResponse {
    // setup
    [ILCannedURLProtocol setCannedResponseData:[self validResponseData]];
    [results setSearchTerm:@"what"];
    [results setLocationTerm:@"where"];
    
    // execute
    [results fetchRestulsForPage:1];

    // assert/verify
    expect(results.results.count).isGoing.toEqual(2);
    expect(results.results).toContain(@"name1");
    expect(results.results).toContain(@"name2");
}

- (void)testInvalidResponse {
    // setup
    [ILCannedURLProtocol setCannedResponseData:[self invalidResponseData]];
    [results setSearchTerm:@"what"];
    [results setLocationTerm:@"where"];
    
    // execute
    [results fetchRestulsForPage:1];
    
    // assert/verify
    expect(results.results.count).isGoing.toEqual(0);
}

- (void)testErrorResponse {
    // setup
    NSError* error = [NSError errorWithDomain:NSURLErrorDomain code:kCFURLErrorTimedOut userInfo:nil];
    [ILCannedURLProtocol setCannedError:error];
    [results setSearchTerm:@"what"];
    [results setLocationTerm:@"where"];
    
    // execute
    [results fetchRestulsForPage:1];
    
    // assert/verify
    expect([results.error code]).isGoing.toEqual([error code]);
    expect([results.error domain]).toEqual([error domain]);
}


@end
