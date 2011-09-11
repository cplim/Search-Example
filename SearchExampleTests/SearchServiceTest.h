//
//  SearchServiceTest.h
//  SearchExample
//
//  Created by C.P. Lim on 11/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "SearchService.h"

@interface SearchServiceTest : SenTestCase
{
    SearchService* searchService;
}

- (void)testShouldIncludeAPIKeyInRequestUrl;
- (void)testShouldIncludeQueryInRequestUrl;
- (void)testShouldIncludeLocationInRequestUrl;

@end
