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
@synthesize searchTerm = _searchTerm;
@synthesize locationTerm = _locationTerm;
@synthesize results = _results;
@synthesize data = _data;
@synthesize totalResults = _totalResults;

- (id)initWithSearchService:(SESearchService*)service {
    self = [super init];
    if (self) {
        self.searchService = [service retain];
        _results = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)execute {
    SESensisSearchURL* searchUrl = [SESensisSearchURL sensisSearchURLWithApiKey:@"u9qwcpa498wksudsrg79nxsx"];
    [[searchUrl searchFor:self.searchTerm] at:self.locationTerm];
    [self.searchService searchBy:searchUrl delegate:self];
    
}

- (void)dealloc {
    [_searchService release];
    [_searchTerm release];
    [_results release];
    [_locationTerm release];
    [super dealloc];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    NSDictionary* json = [_data objectFromJSONData];
    __block NSMutableArray* resultsArray = [[NSMutableArray alloc] init];
    [[json valueForKey:@"results"] enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop) {
        if ([key isEqual:@"name"]) {
            [resultsArray addObject: value];
        }
    }];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
//    NSLog(@"Error!");
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
