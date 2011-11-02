//
//  SESearchResults.h
//  SearchExample
//
//  Created by C.P. Lim on 13/10/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEQueryBuilderFactory.h"

@interface SESearchResults : NSObject {
    int totalResults;
    NSString* searchTerm;
    NSString* locationTerm;
    NSArray* results;
    NSError* error;
}
- (id)initWithQueryBuilderFactory:(SEQueryBuilderFactory*)queryBuilderFactory;
- (void)fetchRestulsFrom:(int)offset limitedTo:(int)maxLimit;
- (int)pageNumberForOffset:(int)offset withLimit:(int)limit;
@property (nonatomic, retain) NSString* searchTerm;
@property (nonatomic, retain) NSString* locationTerm;
@property (nonatomic, retain) NSArray* results;
@property (nonatomic, retain) NSError* error;
@property (nonatomic, assign) int totalResults;
@end
