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
@property (nonatomic, retain) SESearchService* searchService; 
@property (nonatomic, retain) NSString* apiKey;
@property (nonatomic, retain) NSMutableData* data;
@end

@implementation SESearchResults

@synthesize searchService;
@synthesize apiKey;
@synthesize data;
@synthesize searchTerm;
@synthesize locationTerm;
@synthesize results;
@synthesize error;
@synthesize totalResults;

- (id)initWithSearchService:(SESearchService*)service apiKey:(NSString *)key {
    self = [super init];
    if (self) {
        self.searchService = [service retain];
        self.apiKey = [key retain];
        self.results = [NSArray array];
    }
    
    return self;
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
    [searchService release];
    [apiKey release];
    [searchTerm release];
    [results release];
    [locationTerm release];
    [error release];
    [super dealloc];
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
