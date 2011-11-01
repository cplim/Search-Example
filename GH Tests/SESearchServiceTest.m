//
//  SESearchServiceTest.m
//  SearchExample
//
//  Created by C.P. Lim on 10/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h> 
#import "JSONKit.h"
#import "SESearchServiceTest.h"
#import "SESensisQueryBuilder.h"

@interface FailureUrl : NSObject<SEQueryBuilder> 
@end

@implementation FailureUrl

-(NSString*) asQueryUrl {
    return @"http://some-url-that-does-not-exist.com";
}

@end

@implementation SESearchServiceTest

- (void)setUpClass
{
    _searchService = [[SESearchService alloc] init];
}

- (void)tearDownClass
{
    [_searchService release];
}

- (void)testShouldCallSuccessBlockOnSuccess {
    __block BOOL successBlockInvoked = NO;
    _searchService.successCallback = ^(NSData* data) {
        successBlockInvoked = YES;
        [self notify:kGHUnitWaitStatusSuccess forSelector:@selector(testShouldCallSuccessBlockOnSuccess)];
    };
    
    [self prepare];
    SESensisQueryBuilder* url = [SESensisQueryBuilder queryBuilderWithApiKey:@"u9qwcpa498wksudsrg79nxsx"];
    [_searchService searchBy:url];
    
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:5.0];
    
    GHAssertTrue(successBlockInvoked, @"Success block was not invoked");
}

- (void)testShouldCallFailureBlockOnFailure {
    __block BOOL failureBlockInvoked = NO;
    _searchService.failureCallback = ^(NSError* error) {
        failureBlockInvoked = YES;
        [self notify:kGHUnitWaitStatusSuccess forSelector:@selector(testShouldCallFailureBlockOnFailure)];
    };
    
    [self prepare];
    FailureUrl* url = [[FailureUrl alloc] init];
    [_searchService searchBy:url];
    [url release];
    
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:5.0];
    
    GHAssertTrue(failureBlockInvoked, @"Failure block was not invoked");
}

@end
