//
//  SESearchService.m
//  SearchExample
//
//  Created by C.P. Lim on 7/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SESearchService.h"

@implementation SESearchService

@synthesize completed;
@synthesize completedStatus;
@synthesize data;
@synthesize successCallback;
@synthesize failureCallback;

- (id) init 
{
    self = [super init];
    if (self) {
        completed = NO;
        completedStatus = 0;
        data = [[NSMutableData alloc] init];
    }
    
    return self;
}

- (void) dealloc
{
    [data release];
    [successCallback release];
    [failureCallback release];
    [super dealloc];
}

- (void)searchBy:(id<SEQueryBuilder>)search {
    [self searchBy:search delegate:self];
}

- (void) searchBy:(id<SEQueryBuilder>)search delegate:(id)delegate
{
    NSString* query = [search asQueryUrl];
    NSURL* queryUrl = [NSURL URLWithString:query];
    NSURLRequest* requestUrl = [[NSURLRequest alloc] initWithURL:queryUrl];
    
    NSURLConnection* queryConnection = [[NSURLConnection alloc] initWithRequest:requestUrl delegate:delegate];
    
    [queryConnection release];
    [requestUrl release];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    self.completed = YES;
    self.completedStatus = 200;
    successCallback(data);
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    self.completed = YES;
    self.completedStatus = 500;
    failureCallback(error);
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)receivedData {
    [self.data appendData:receivedData];
}

@end
