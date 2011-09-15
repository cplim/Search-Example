//
//  SESearchServiceTest.h
//  SearchExample
//
//  Created by C.P. Lim on 10/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SESearchService.h"

@interface SESearchServiceTest : GHAsyncTestCase {
    SESearchService* _searchService;
    NSMutableData* _data;
}
- (void)testShouldReturnResultsWhenSearchIsInvoked;

@end

