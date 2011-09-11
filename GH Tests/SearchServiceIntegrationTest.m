//
//  SearchServiceIntegrationTest.m
//  SearchExample
//
//  Created by C.P. Lim on 10/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h> 
#import "SearchServiceIntegrationTest.h"

@implementation SearchServiceIntegrationTest

- (void)setUpClass
{
    searchService = [[SearchService alloc] initWithApiKey:@"u9qwcpa498wksudsrg79nxsx"];
}

- (void)tearDownClass
{
    [searchService release];
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
    [self notify:kGHUnitWaitStatusSuccess forSelector:@selector(testShouldReturnResultsWhenSearchIsInvoked)];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // Notify of connection failure
    GHTestLog(@"Failed loading");
    [self notify:kGHUnitWaitStatusFailure forSelector:@selector(testURLConnection)];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    GHTestLog(@"%@", [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease]);
} 

@end
