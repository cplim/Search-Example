//
//  SESensisResultsSummary.m
//  SearchExample
//
//  Created by C.P. Lim on 30/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SESensisResultsSummary.h"

@implementation SESensisResultsSummary

@synthesize totalResults;
@synthesize totalPages;
@synthesize count;
@synthesize currentPage;
@synthesize success;

- (id)init
{
    return [self initWithJsonData:nil];
}

- (id)initWithJsonData:(NSDictionary*)jsonData
{
    self = [super init];
    if (self) {
        NSNumberFormatter* numberFormatter = [[NSNumberFormatter alloc] init];
        count = [[numberFormatter numberFromString:[jsonData objectForKey:@"count"]] intValue];
        currentPage = [[numberFormatter numberFromString:[jsonData objectForKey:@"currentPage"]] intValue];
        totalResults = [[numberFormatter numberFromString:[jsonData objectForKey:@"totalResults"]] intValue];
        totalPages = [[numberFormatter numberFromString:[jsonData objectForKey:@"totalPages"]] intValue];
        success = [[jsonData objectForKey:@"code"] hasPrefix:@"2"];
    }
    
    return self;
}

+ (id) searchResultsWithJsonData:(NSDictionary *)jsonData
{
    SESensisResultsSummary* searchResults = [[SESensisResultsSummary alloc] initWithJsonData:jsonData];
    return [searchResults autorelease];
}

@end
