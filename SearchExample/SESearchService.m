//
//  SESearchService.m
//  SearchExample
//
//  Created by C.P. Lim on 7/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SESearchService.h"

@interface SESearchService (private)
- (NSString*) queryUrl:(NSString*)what location:(NSString*)where;
@end

@implementation SESearchService

- (id) init 
{
    self = [super init];
    if (self) {
    }
    
    return self;
}

- (void) dealloc
{
    [super dealloc];
}

- (void) searchBy:(SESensisSearchURL *)search delegate:(id)delegate
{
    NSString* query = [search asQueryUrl];
    NSURL* queryUrl = [NSURL URLWithString:query];
    NSURLRequest* requestUrl = [[NSURLRequest alloc] initWithURL:queryUrl];
    
    NSURLConnection* queryConnection = [[NSURLConnection alloc] initWithRequest:requestUrl delegate:delegate];
    
    [queryConnection release];
    [requestUrl release];
}

@end
