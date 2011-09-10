//
//  SearchServiceTest.m
//  SearchExample
//
//  Created by C.P. Lim on 7/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SearchServiceTest.h"
#import <OCMock/OCMock.h>

@interface TestDelegate : NSObject {
}
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void) connectionDidFinishLoading:(NSURLConnection *)connection;
- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
@end

@implementation TestDelegate
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"Called didReceiveResponse:%@", response);
}
- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data 
{
    NSLog(@"Called didReceiveData:%@", data);
}
- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Called didFinishLoading");
}
- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Called didFailWithError:%@", error);
}
@end

@implementation SearchServiceTest

- (void)setUp {
    [super setUp];
    searchService = [[SearchService alloc] initWithApiKey:@"u9qwcpa498wksudsrg79nxsx"];
//    mockDelegate = [OCMockObject mockForClass:[TestDelegate class]];
//    [[mockDelegate expect] connection:[OCMArg any] didReceiveData:[OCMArg any]];
    
    mockDelegate = [[TestDelegate alloc] init];
}

- (void)tearDown {
    [searchService release];
    [mockDelegate release];
    [super tearDown];
}

- (void)testShouldReturnResultsWhenSearchIsInvoked {
    [searchService searchFor:@"motor cars" at:@"melbourne vic" delegate:mockDelegate];
}

@end
