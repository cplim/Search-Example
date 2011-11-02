//
//  SESearchResults.m
//  SearchExample
//
//  Created by C.P. Lim on 13/10/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SESearchResults.h"
#import "SESensisQueryBuilder.h"
#import "JSONKit.h"

@interface SESearchResults() 
@property (nonatomic, retain) SEQueryBuilderFactory* queryBuilderFactory;
@property (nonatomic, retain) NSMutableData* data;
@end

@implementation SESearchResults

@synthesize queryBuilderFactory;
@synthesize data;
@synthesize searchTerm;
@synthesize locationTerm;
@synthesize results;
@synthesize error;
@synthesize totalResults;

- (id)initWithQueryBuilderFactory:(SEQueryBuilderFactory*)factory {
    self = [super init];
    if (self) {
        self.queryBuilderFactory = [factory retain];
        self.results = [NSArray array];
    }
    
    return self;
}

- (void)dealloc {
    [queryBuilderFactory release];
    [searchTerm release];
    [results release];
    [locationTerm release];
    [error release];
    [super dealloc];
}

- (int)pageNumberForOffset:(int)offset withLimit:(int)limit {
    return 1 + (offset / limit);
}

- (void)fetchRestulsFrom:(int)offset limitedTo:(int)maxLimit {
    // build query url
    SESensisQueryBuilder* queryBuilder = [queryBuilderFactory sensisQueryBuilder];
    [queryBuilder searchFor:self.searchTerm]; 
    [queryBuilder at:self.locationTerm];
    [queryBuilder onPage:[self pageNumberForOffset:offset withLimit:maxLimit]];
    [queryBuilder withRows:maxLimit];
    
    // execute search
    NSURLRequest* requestUrl = [NSURLRequest requestWithURL:[NSURL URLWithString:[queryBuilder asQueryUrl]]];
    [NSURLConnection connectionWithRequest:requestUrl delegate:self];
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
