//
//  SEJsonParser.h
//  SearchExample
//
//  Created by C.P. Lim on 29/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEJsonCallback.h"

@interface SEJsonParser : NSObject
{
    id<SEJsonCallback> callback;
    NSMutableData* jsonData;
}
+ (id)jsonParserWithCallback:(id<SEJsonCallback>)callback;
- (id)initWithCallback:(id<SEJsonCallback>)callback;

@end
