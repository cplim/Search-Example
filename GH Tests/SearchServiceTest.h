//
//  ExampleAsyncTest.h
//  SearchExample
//
//  Created by C.P. Lim on 10/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchService.h"

@interface SearchServiceTest : GHAsyncTestCase {
    SearchService *searchService;
}
- (void)testShouldReturnResultsWhenSearchIsInvoked;
@end

