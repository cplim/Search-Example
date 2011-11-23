//
//  SESearchResultsTest.m
//  SearchExample
//
//  Created by C.P. Lim on 23/10/11.
//  Copyright (c) 2011 C.P. Lim. All rights reserved.
//

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "SESearchResultsTest.h"
#import "SESearchResults.h"
#import "ILCannedURLProtocol.h"

@interface SESearchResultsTest()
- (NSData*)validResponseData;
- (NSData*)validResponseDataForPage:(int)pageNumber;
- (NSData*)invalidResponseData;
@property (nonatomic, retain) SESearchResults* results;
@property (nonatomic, retain) SEQueryBuilderFactory* queryBuilderFactory;
@end

@implementation SESearchResultsTest

@synthesize results;
@synthesize queryBuilderFactory;
//@synthesize queryBuilder;

- (void)setUp {
    [super setUp];
    
    queryBuilderFactory = [[SEQueryBuilderFactory alloc] initWithSensisApiKey:@"api key"];
    results = [[SESearchResults alloc] initWithQueryBuilderFactory:queryBuilderFactory];
    
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
    [queryBuilderFactory release];
    
    [super tearDown];
}

- (NSData*) validResponseData {
    return [self validResponseDataForPage:1];
}

- (NSData*) validResponseDataForPage:(int)pageNumber {
    return [[NSString stringWithFormat:@"{\"count\":\"2\",\"currentPage\":\"%d\",\"results\":[{\"name\":\"name1\"},{\"name\":\"name2\"}], \"totalResults\":10}", pageNumber] dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSData*) invalidResponseData {
    return [@"{\"ok\":\"no\"}" dataUsingEncoding:NSUTF8StringEncoding];
}

- (void)testInvalidResponse {
    // given
    [ILCannedURLProtocol setCannedResponseData:[self invalidResponseData]];
    [results setSearchTerm:@"what"];
    [results setLocationTerm:@"where"];
    
    // when
    [results fetchRestulsFrom:0 limitedTo:2];
    
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
    [results fetchRestulsFrom:0 limitedTo:2];
    
    // then
    expect([results.error code]).isGoing.toEqual([error code]);
    expect([results.error domain]).toEqual([error domain]);
}

- (void)testShouldReturnTotalResultsCount {
    // given
    [ILCannedURLProtocol setCannedResponseData:[self validResponseData]];
    [results setSearchTerm:@"what"];
    [results setLocationTerm:@"where"];
    
    // when
    [results fetchRestulsFrom:0 limitedTo:2];
    
    // then
    expect(results.totalResults).isGoing.toEqual(10);
}


- (void) testShouldReturnPageOne {
    expect([results pageNumberForOffset:0 withLimit:10]).toEqual(1);
}

- (void) testShouldReturnPageTwo {
    expect([results pageNumberForOffset:10 withLimit:10]).toEqual(2);
}

- (void)testShouldReturnResultsArray {
    // given
    [ILCannedURLProtocol setCannedResponseData:[self validResponseData]];
    [results setSearchTerm:@"what"];
    [results setLocationTerm:@"where"];
    
    // when
    [results fetchRestulsFrom:0 limitedTo:2];
    
    // then
    expect(results.results.count).isGoing.toEqual(2);
    expect(results.results).toContain(@"name1");
    expect(results.results).toContain(@"name2");
}

- (void)testShouldAccumulateResultsWhenCallingSecondPage {
    // given
    [ILCannedURLProtocol setCannedResponseData:[self validResponseDataForPage:2]];
    NSArray* existingResults = [NSArray arrayWithObjects:@"nameX", @"nameY", nil];
    [results setResults:existingResults];
    [results setLocationTerm:@"where"];
    [results setSearchTerm:@"what"];
    [results setLocationTerm:@"where"];
    
    // when
    [results fetchRestulsFrom:2 limitedTo:2];
    
    // then
    expect(results.results.count).isGoing.toEqual(4);
    expect(results.results).toContain(@"nameX");
    expect(results.results).toContain(@"nameY");
    expect(results.results).toContain(@"name1");
    expect(results.results).toContain(@"name2");
}

- (void)testShouldNotFetchDataWhenOffsetAlreadyContainsData {
    // expectations
    id mockFactory = [OCMockObject mockForClass:[SEQueryBuilderFactory class]];
    SESearchResults* searchResultsWithMock = [[SESearchResults alloc] initWithQueryBuilderFactory:mockFactory];
    
    NSArray* existingResults = [NSArray arrayWithObjects:@"nameX", @"nameY", @"nameZ", nil];
    [searchResultsWithMock setResults:existingResults];
    [searchResultsWithMock setLocationTerm:@"where"];
    [searchResultsWithMock setSearchTerm:@"what"];
    [searchResultsWithMock setLocationTerm:@"where"];
    
    // execute
    [searchResultsWithMock fetchRestulsFrom:2 limitedTo:2];
    
    // verify
    [mockFactory verify];
}


- (void) testShouldVerifyArgumentsPassedToQueryBuilder {
    NSString* searchTerm = @"what";
    NSString* locationTerm = @"where";
    NSString* queryUrl = @"http://url.com";
    int pageNumber = 1;
    int rows = 20;
    
    // expectations
    id mockFactory = [OCMockObject mockForClass:[SEQueryBuilderFactory class]];
    id mockBuilder = [OCMockObject mockForClass:[SESensisQueryBuilder class]];
    [[[mockFactory stub] andReturn:mockBuilder] sensisQueryBuilder];
    [[[mockBuilder expect] andReturn:self] searchFor:searchTerm];
    [[[mockBuilder expect] andReturn:self] at:locationTerm];
    [[[mockBuilder expect] andReturn:self] onPage:pageNumber];
    [[[mockBuilder expect] andReturn:self] withRows:rows];
    [[[mockBuilder expect] andReturn:queryUrl] asQueryUrl];
    
    SESearchResults* searchResultsWithMock = [[SESearchResults alloc] initWithQueryBuilderFactory:mockFactory];
    [searchResultsWithMock setSearchTerm:searchTerm];
    [searchResultsWithMock setLocationTerm:locationTerm];
    [searchResultsWithMock fetchRestulsFrom:0 limitedTo:rows];
    
    [searchResultsWithMock release];
    [mockBuilder verify];
    [mockFactory verify];
}

@end
