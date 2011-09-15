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
#import "SESensisSearchURL.h"

@implementation SESearchServiceTest

- (void)setUpClass
{
    _searchService = [[SESearchService alloc] init];
    _data = nil;
}

- (void)tearDownClass
{
    [_searchService release];
    if(_data != nil) {
        [_data release];
    }
}

- (void)testShouldReturnResultsWhenSearchIsInvoked {
    [self prepare];
    
    SESensisSearchURL* sensisSearchURL = [SESensisSearchURL sensisSearchURLWithApiKey:@"u9qwcpa498wksudsrg79nxsx"];
    
    [_searchService searchBy:sensisSearchURL delegate:self];
    
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
