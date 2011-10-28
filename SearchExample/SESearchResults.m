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

@implementation SESearchResults

@synthesize searchService = _searchService;
@synthesize apiKey = _apiKey;
@synthesize searchTerm = _searchTerm;
@synthesize locationTerm = _locationTerm;
@synthesize results = _results;
@synthesize error = _error;
@synthesize data = _data;
@synthesize totalResults = _totalResults;

- (id)initWithSearchService:(SESearchService*)service apiKey:(NSString *)apiKey {
    self = [super init];
    if (self) {
        self.searchService = [service retain];
        self.apiKey = [apiKey retain];
        _results = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (id)initWithSearchService:(SESearchService*)service {
    return [self initWithSearchService:service apiKey:@""];
}

- (void)fetchRestulsForPage:(int)pageNumber {
    // build query url
    SESensisSearchURL* searchUrl = [SESensisSearchURL sensisSearchURLWithApiKey:self.apiKey];
    [searchUrl searchFor:self.searchTerm]; 
    [searchUrl at:self.locationTerm];
    [searchUrl onPage:pageNumber];
    
    // execute search
    [self.searchService searchBy:searchUrl delegate:self];
    
}

- (void)dealloc {
    [_searchService release];
    [_apiKey release];
    [_searchTerm release];
    [_results release];
    [_locationTerm release];
    [_error release];
    [super dealloc];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    NSDictionary* json = [_data objectFromJSONData];
    NSArray* results = [json valueForKey:@"results"];
    self.totalResults = [[json valueForKey:@"totalResults"] intValue];
    [results enumerateObjectsUsingBlock:^(id result, NSUInteger index, BOOL* stop) {
        [self.results addObject: [result valueForKey:@"name"]];
    }];
    [_data release];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    _error = [error retain];
    [_data release];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)receivedData {
    if(_data == nil) {
        _data = [[NSMutableData alloc] initWithData:receivedData];
    }
    else {
        [_data appendData:receivedData];
    }
}



@end
