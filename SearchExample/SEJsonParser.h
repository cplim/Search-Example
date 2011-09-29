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
    NSObject<SEJsonCallback>* callback;
    NSMutableData* jsonData;
}

- (SEJsonParser*)initWithCallback:(NSObject<SEJsonCallback>*)callback;

@end
