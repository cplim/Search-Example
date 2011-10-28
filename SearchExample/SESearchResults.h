//
//  SESearchResults.h
//  SearchExample
//
//  Created by C.P. Lim on 13/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SESearchService.h"

@interface SESearchResults : NSObject {
    NSString* _apiKey;
    int _totalResults;
    NSString* _searchTerm;
    NSString* _locationTerm;
    SESearchService* _searchService;
    NSMutableArray* _results;
    NSMutableData* _data;
    NSError* _error;
}
- (id)initWithSearchService:(SESearchService*)searchService;
- (id)initWithSearchService:(SESearchService*)searchService apiKey:(NSString*)apiKey;
- (void)fetchRestulsForPage:(int)pageNumber;
@property (nonatomic, retain) SESearchService* searchService; 
@property (nonatomic, retain) NSString* apiKey;
@property (nonatomic, retain) NSString* searchTerm;
@property (nonatomic, retain) NSString* locationTerm;
@property (nonatomic, readonly) NSMutableArray* results;
@property (nonatomic, retain) NSError* error;
@property (nonatomic, retain) NSData* data;
@property (nonatomic, assign) int totalResults;
@end
