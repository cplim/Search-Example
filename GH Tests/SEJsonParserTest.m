//
//  SEJsonParserTest.m
//  SearchExample
//
//  Created by C.P. Lim on 29/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <OCMock/OCMock.h>
#import "SEJsonParserTest.h"
#import "SEJsonCallback.h"

@implementation SEJsonParserTest

-(void)setUp
{
    [super setUp];
    mockCallback = [OCMockObject mockForProtocol:@protocol(SEJsonCallback)];
    jsonSearchResultsParser = [[SEJsonParser alloc] initWithCallback:mockCallback];
}

-(void)tearDown
{
    [jsonSearchResultsParser release];
    [super tearDown];
}

-(void)testShouldCallbackSuccessOnCompletion
{
    [[mockCallback expect] onSuccess:[OCMArg checkWithBlock:^(id dictionary) {
        NSString* value = [dictionary objectForKey:@"key"];
        if (value != nil) {
            return [value isEqualToString:@"value"];
        }
        return NO;
    }]];
    NSString* jsonString = @"{ \"key\":\"value\" }";
    
    [jsonSearchResultsParser connection:nil didReceiveData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    [jsonSearchResultsParser connectionDidFinishLoading:nil];
    
    [mockCallback verify];
}

-(void)testShouldCallbackFailureOnError
{
    [[mockCallback expect] onFailure:[OCMArg any]];

    [jsonSearchResultsParser connection:nil didFailWithError:nil];
    
    [mockCallback verify];
}

@end
