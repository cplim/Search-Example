//
//  SEJsonParserTest.h
//  SearchExample
//
//  Created by C.P. Lim on 29/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <GHUnitIOS/GHTestCase.h>
#import "SEJsonParser.h"

@interface SEJsonParserTest : GHTestCase
{
    SEJsonParser* jsonParser;
    id mockCallback;
}

-(void)testShouldCallbackSuccessOnCompletion;
-(void)testShouldCallbackFailureOnError;

@end
