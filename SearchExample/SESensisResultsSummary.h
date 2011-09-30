//
//  SESensisResultsSummary.h
//  SearchExample
//
//  Created by C.P. Lim on 30/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SESensisResultsSummary : NSObject
{
    int totalResults;
    int totalPages;
    int count;
    int currentPage;
    BOOL success;
}
@property (readonly) int totalResults;
@property (readonly) int totalPages;
@property (readonly) int count;
@property (readonly) int currentPage;
@property (readonly) BOOL success;

+ (id)searchResultsWithJsonData:(NSDictionary*)jsonData;
- (id)initWithJsonData:(NSDictionary*)jsonData;

@end
