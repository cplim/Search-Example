//
//  SESensisSearchURL.m
//  SearchExample
//
//  Created by C.P. Lim on 16/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SESensisSearchURL.h"

@interface SESensisSearchURL (private) 
@end

@implementation SESensisSearchURL

+ (SESensisSearchURL*) sensisSearchURLWithApiKey:(NSString *)apiKey
{
    SESensisSearchURL* sensisSearchURL = [[SESensisSearchURL alloc] initWithApiKey:apiKey];
    return [sensisSearchURL autorelease];
}

- (id) init 
{
    return [self initWithApiKey:@""];
}

- (id)initWithApiKey:(NSString *)key
{
    self = [super init];
    if (self) {
        _apiKey = [[NSString alloc] initWithString:key];
    }
    
    return self;
}

- (void) dealloc
{
    [_apiKey release];
    if(_what != nil) 
    {
        [_what release];
    }
    if(_where != nil) 
    {
        [_where release];
    }
    [super dealloc];
}

- (SESensisSearchURL*) searchFor:(NSString *)what {
    _what = [[NSString alloc] initWithString:what];
    return self;
}

- (SESensisSearchURL*) at:(NSString *)where {
    _where = [[NSString alloc] initWithString:where];
    return self;
}

-(SESensisSearchURL*) onPage:(int)pageNumber {
    _pageNumber = pageNumber;
    return self;
}


- (NSString*) asQueryUrl
{
    NSMutableString* urlString = [NSMutableString stringWithFormat:@"http://api.sensis.com.au/ob-20110511/test/search?key=%@", 
                                  [_apiKey stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]; 
    
    if ([_what length] != 0) {
        [urlString appendFormat:@"&query=%@", [_what stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    }
    
    if ([_where length] != 0) {
        [urlString appendFormat:@"&location=%@", [_where stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    }
    
    if (_pageNumber > 1) {
        [urlString appendFormat:@"&page=%d", _pageNumber];
    }
    
    return urlString;
}

@end
