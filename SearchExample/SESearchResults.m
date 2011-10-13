//
//  SESearchResults.m
//  SearchExample
//
//  Created by C.P. Lim on 13/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SESearchResults.h"

@implementation SESearchResults

@synthesize searchService = _searchService;
@synthesize searchTerm = _searchTerm;
@synthesize locationTerm = _locationTerm;
@synthesize totalResults = _totalResults;

- (id)initWithSearchService:(SESearchService*)service {
    self = [super init];
    if (self) {
        self.searchService = [service retain];
    }
    
    return self;
}

- (void)dealloc {
    [_searchService release];
    [_searchTerm release];
    [_locationTerm release];
    [super dealloc];
}

@end
