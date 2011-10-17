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
    int _totalResults;
    NSString* _searchTerm;
    NSString* _locationTerm;
    SESearchService* _searchService;
    NSMutableArray* _results;
    NSMutableData* _data;
}
- (id)initWithSearchService:(SESearchService*)searchService;
- (void)execute;
@property (nonatomic, retain) SESearchService* searchService; 
@property (nonatomic, retain) NSString* searchTerm;
@property (nonatomic, retain) NSString* locationTerm;
@property (nonatomic, readonly) NSMutableArray* results;
@property (nonatomic, retain) NSData* data;
@property (nonatomic, assign) int totalResults;
@end
