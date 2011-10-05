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
    [super dealloc];
}

- (void)searchBy:(id<SEQueryURL>)search {
    
}

- (void) searchBy:(id<SEQueryURL>)search delegate:(id)delegate
{
    NSString* query = [search asQueryUrl];
    NSURL* queryUrl = [NSURL URLWithString:query];
    NSURLRequest* requestUrl = [[NSURLRequest alloc] initWithURL:queryUrl];
    
    NSURLConnection* queryConnection = [[NSURLConnection alloc] initWithRequest:requestUrl delegate:delegate];
    
    [queryConnection release];
    [requestUrl release];
}

@end
