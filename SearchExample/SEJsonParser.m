//
//  SEJsonParser.m
//  SearchExample
//
//  Created by C.P. Lim on 29/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SEJsonParser.h"
#import "JSONKit.h"

@implementation SEJsonParser
+ (id) jsonParserWithCallback:(id<SEJsonCallback>)callback {
    SEJsonParser* jsonParser = [[SEJsonParser alloc] initWithCallback:callback];
    return [jsonParser autorelease];
}

- (id) init {
    return [self initWithCallback:nil];
}

- (void)dealloc {
    callback = nil;
    [jsonData release];
    [super dealloc];
}

- (id) initWithCallback:(id<SEJsonCallback>)callbackArgument {
    self = [super init];
    if (self) {
        callback = callbackArgument;
        jsonData = [[NSMutableData alloc] init];
    }
    
    return self;
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    NSDictionary* json = [jsonData objectFromJSONData];
    [callback onSuccess:json];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [callback onFailure:error];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [jsonData appendData:data];
}
@end
