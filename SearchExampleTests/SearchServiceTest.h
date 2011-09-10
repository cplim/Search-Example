//
//  SearchServiceTest.h
//  SearchExample
//
//  Created by C.P. Lim on 7/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "SearchService.h"

@interface SearchServiceTest : SenTestCase {
@private
    SearchService *searchService;
    id mockDelegate;
}
- (void)testShouldReturnResultsWhenSearchIsInvoked;
@end
