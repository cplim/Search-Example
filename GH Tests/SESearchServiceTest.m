//
//  SESearchServiceTest.m
//  SearchExample
//
//  Created by C.P. Lim on 10/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h> 
#import "JSONKit.h"
#import "SESearchServiceTest.h"

@implementation SESearchServiceTest

- (void)setUpClass
{
    searchService = [[SESearchService alloc] initWithApiKey:@"u9qwcpa498wksudsrg79nxsx"];
    _data = nil;
}

- (void)tearDownClass
{
    [searchService release];
    if(_data != nil) {
        [_data release];
    }
}

- (void)testShouldIncludeAPIKeyInRequestUrl
{
    NSString* queryUrl = [searchService queryUrl:nil location:nil];
    GHAssertTrue([queryUrl rangeOfString:@"key=u9qwcpa498wksudsrg79nxsx"].location != NSNotFound, @"Failed to include key in url");
}

- (void) testShouldIncludeQueryInRequestUrlWhenSpecified
{
    NSString* queryUrl = [searchService queryUrl:@"motor cars used" location:nil];
    GHAssertTrue([queryUrl rangeOfString:@"query=motor%20cars%20used"].location != NSNotFound, @"Failed to include query in url");
}

- (void) testShouldNotIncludeQueryInRequestUrlWhenNotSpecified
{
    NSString* queryUrl = [searchService queryUrl:nil location:nil];
    GHAssertTrue([queryUrl rangeOfString:@"query="].location == NSNotFound, @"Should not include query in url");
}

- (void)testShouldIncludeLocationInRequestUrlWhenSpecified
{
    NSString* queryUrl = [searchService queryUrl:nil location:@"26 xyz road, suburb north"];
    GHAssertTrue([queryUrl rangeOfString:@"location=26%20xyz%20road,%20suburb%20north"].location != NSNotFound, @"Failed to include location in url");
}

- (void)testShouldNotIncludeLocationInRequestUrlWhenNotSpecified
{
    NSString* queryUrl = [searchService queryUrl:nil location:nil];
    GHAssertTrue([queryUrl rangeOfString:@"location="].location == NSNotFound, @"Should not include location in url");
}

- (void)testShouldReturnResultsWhenSearchIsInvoked {
    [self prepare];
    
    [searchService searchFor:@"motor cars" at:@"222 lonsdale st, melbourne vic" delegate:self];
    
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:10.0];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // Notify of success, specifying the method where wait is called.
    // This prevents stray notifies from affecting other tests.
    GHTestLog(@"Finished loading!");
    
    if([_data length] > 0) {
        NSDictionary* json = [[JSONDecoder decoder] objectWithData:_data];
//        GHTestLog([json objectForKey:@"time"]);
    }
    
    [self notify:kGHUnitWaitStatusSuccess forSelector:@selector(testShouldReturnResultsWhenSearchIsInvoked)];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // Notify of connection failure
    GHTestLog(@"Failed loading");
    [self notify:kGHUnitWaitStatusFailure forSelector:@selector(testURLConnection)];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //GHTestLog(@"%@", [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease]);
    GHTestLog(@"Called didReceiveData");
    if(_data == nil) {
        _data = [[NSMutableData alloc] initWithData:data];
    }
    else {
        [_data appendData:data];
    }
} 

@end
