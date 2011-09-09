//
//  SearchServiceTest.m
//  SearchExample
//
//  Created by C.P. Lim on 7/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SearchServiceTest.h"
#import <OCMock/OCMock.h>

@implementation SearchServiceTest

- (void)setUp {
    [super setUp];
    searchService = [[SearchService alloc] initWithApiKey:@"u9qwcpa498wksudsrg79nxsx"];
    [searchService retain];
}

- (void)tearDown {
    [searchService release];
    [super tearDown];
}

- (void)testShouldReturnResultsWhenSearchIsInvoked {
    id mockDelegate = [OCMockObject mockForClass:[NSObject class]];
    [[mockDelegate expect] connection:[OCMArg any] didReceiveData:[OCMArg any]];
    
    [searchService searchFor:@"cars" at:@"melbourne vic" delegate:mockDelegate];

    [mockDelegate verify];
}

@end
