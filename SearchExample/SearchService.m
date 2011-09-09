//
//  SearchService.m
//  SearchExample
//
//  Created by C.P. Lim on 7/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchService.h"

@implementation SearchService

- (id) init 
{
    return [self initWithApiKey:@""];
}

- (id)initWithApiKey:(NSString *)key
{
    self = [super init];
    if (self) {
        apiKey = [[NSString alloc] initWithString:key];
    }
    
    return self;
}

- (void) dealloc
{
    [apiKey release];
    [super dealloc];
}

- (void) searchFor:(NSString*)what at:(NSString*)where delegate:(id)delegate
{
    NSString* query = [NSString stringWithFormat:@"http://api.sensis.com.au/ob-20110511/test/search?key=%s&query=%s&location=%s", apiKey, what, where];
    NSURL* queryUrl = [NSURL URLWithString:query];
    NSURLRequest* requestUrl = [[NSURLRequest alloc] initWithURL:queryUrl];
    
    NSURLConnection* queryConnection = [[NSURLConnection alloc] initWithRequest:requestUrl delegate:delegate];
    
    [queryConnection release];
    [requestUrl release];
}


@end
