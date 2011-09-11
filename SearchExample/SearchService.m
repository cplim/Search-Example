//
//  SearchService.m
//  SearchExample
//
//  Created by C.P. Lim on 7/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchService.h"

@interface SearchService (private)
- (NSString*) queryUrl:(NSString*)what location:(NSString*)where;
@end

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
    NSString* query = [self queryUrl:what location:where];
    NSURL* queryUrl = [NSURL URLWithString:query];
    NSURLRequest* requestUrl = [[NSURLRequest alloc] initWithURL:queryUrl];
    
    NSURLConnection* queryConnection = [[NSURLConnection alloc] initWithRequest:requestUrl delegate:delegate];
    
    [queryConnection release];
    [requestUrl release];
}

- (NSString*) queryUrl:(NSString*)what location:(NSString*)where
{
    return  [NSString stringWithFormat:@"http://api.sensis.com.au/ob-20110511/test/search?key=%@&query=%@&location=%@", 
            [apiKey stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], 
            [what stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding], 
            [where stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}

@end
