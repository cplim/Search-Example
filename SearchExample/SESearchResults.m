//
//  SESearchResults.m
//  SearchExample
//
//  Created by C.P. Lim on 13/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SESearchResults.h"
#import "SESensisSearchURL.h"
#import "JSONKit.h"

@interface SESearchResults() 
@property (nonatomic, retain) NSString* apiKey;
@property (nonatomic, retain) NSMutableData* data;
- (void) searchBy:(SESensisSearchURL*)search delegate:(id)delegate;
@end

@implementation SESearchResults

@synthesize apiKey;
@synthesize data;
@synthesize searchTerm;
@synthesize locationTerm;
@synthesize results;
@synthesize error;
@synthesize totalResults;

- (id)initWithApiKey:(NSString *)key {
    self = [super init];
    if (self) {
        self.apiKey = [key retain];
        self.results = [NSArray array];
    }
    
    return self;
}

- (void)dealloc {
    [apiKey release];
    [searchTerm release];
    [results release];
    [locationTerm release];
    [error release];
    [super dealloc];
}

- (void)fetchRestulsForPage:(int)pageNumber {
    // build query url
    SESensisSearchURL* searchUrl = [SESensisSearchURL sensisSearchURLWithApiKey:self.apiKey];
    [searchUrl searchFor:self.searchTerm]; 
    [searchUrl at:self.locationTerm];
    [searchUrl onPage:pageNumber];
    
    // execute search
    [self searchBy:searchUrl delegate:self];
}

- (void) searchBy:(SESensisSearchURL*)search delegate:(id)delegate
{
    NSString* query = [search asQueryUrl];
    NSURL* queryUrl = [NSURL URLWithString:query];
    NSURLRequest* requestUrl = [[NSURLRequest alloc] initWithURL:queryUrl];
    
    NSURLConnection* queryConnection = [[NSURLConnection alloc] initWithRequest:requestUrl delegate:delegate];
    
    [queryConnection release];
    [requestUrl release];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    [self.data release];
    NSDictionary* json = [data objectFromJSONData];
    self.totalResults = [[json valueForKey:@"totalResults"] intValue];
    NSArray* jsonResults = [json valueForKey:@"results"];
    NSMutableArray* objectResults = [[NSMutableArray alloc] initWithArray:self.results];
    [jsonResults enumerateObjectsUsingBlock:^(id result, NSUInteger index, BOOL* stop) {
        [objectResults addObject: [result valueForKey:@"name"]];
    }];
    self.results = [objectResults retain];
    [objectResults release];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)e {
    [self.data release];
    self.error = [e retain];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)receivedData {
    if(self.data == nil) {
        self.data = [[NSMutableData alloc] initWithData:receivedData];
    }
    else {
        [self.data appendData:receivedData];
    }
}



@end
