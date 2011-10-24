//
//  SESearchResultsTest.m
//  SearchExample
//
//  Created by C.P. Lim on 23/10/11.
//  Copyright (c) 2011 C.P. Lim. All rights reserved.
//

#import "SESearchResultsTest.h"
#import "SESearchResults.h"
#import "ILCannedURLProtocol.h"

@interface SESearchResultsTest()
@property (nonatomic, retain) SESearchResults* results;
@end

@implementation SESearchResultsTest

@synthesize results;

static NSString* SuccessContext = @"success";
static NSString* FailureContext = @"failure";


- (void)setUp {
    [super setUp];
    
    SESearchService* searchService = [[SESearchService alloc] init];
    results = [[SESearchResults alloc] initWithSearchService:searchService];
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

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self notify:kGHUnitWaitStatusSuccess forSelector:(SEL)context];
}

- (void)testValidResponseData {
    [self prepare];
    
    // setup
    [ILCannedURLProtocol setCannedResponseData:[self validResponseData]];
    [results addObserver:self forKeyPath:@"totalResults" options:0 context:_cmd]; // context: current method selector
    [results setSearchTerm:@"what"];
    [results setLocationTerm:@"where"];
    
    // execute
    [results execute];

    // assert/verify
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:5.0];
    GHAssertEquals(results.totalResults, 2, @"total results should be the same");
}

- (void)testInvalidResponseData {
    [self prepare];
    
    // setup
    [ILCannedURLProtocol setCannedResponseData:[self invalidResponseData]];
    [results addObserver:self forKeyPath:@"totalResults" options:0 context:_cmd]; // context: current method selector
    [results setSearchTerm:@"what"];
    [results setLocationTerm:@"where"];
    
    // execute
    [results execute];
    
    // assert/verify
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:5.0];
    GHAssertEquals(results.totalResults, 0, @"total results should be the same");
}

@end
