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

- (id)init
{
    return [self initWithCallback:nil];
}

- (void)dealloc
{
    [callback release];
    [jsonData release];
    [super dealloc];
}

- (SEJsonParser*)initWithCallback:(NSObject<SEJsonCallback>*)callbackArgument
{
    self = [super init];
    if (self) {
        callback = [callbackArgument retain];
        jsonData = [[NSMutableData alloc] init];
    }
    
    return self;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSDictionary* json = [jsonData objectFromJSONData];
    [callback onSuccess:json];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [callback onFailure:error];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [jsonData appendData:data];
}
@end
