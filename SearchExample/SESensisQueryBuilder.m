//
//  SESensisQueryBuilder.m
//  SearchExample
//
//  Created by C.P. Lim on 16/09/11.
//  Copyright 2011 C.P. Lim. All rights reserved.
//

#import "SESensisQueryBuilder.h"

@implementation SESensisQueryBuilder

+ (SESensisQueryBuilder*) queryBuilderWithApiKey:(NSString *)apiKey
{
    SESensisQueryBuilder* queryBuilder = [[SESensisQueryBuilder alloc] initWithApiKey:apiKey];
    return [queryBuilder autorelease];
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

- (SESensisQueryBuilder*) searchFor:(NSString *)what {
    _what = [[NSString alloc] initWithString:what];
    return self;
}

- (SESensisQueryBuilder*) at:(NSString *)where {
    _where = [[NSString alloc] initWithString:where];
    return self;
}

-(SESensisQueryBuilder*) onPage:(int)pageNumber {
    _pageNumber = pageNumber;
    return self;
}

-(SESensisQueryBuilder*) withRows:(int)rows {
    _rows = rows;
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
    
    if (_rows > 0) {
        [urlString appendFormat:@"&rows=%d", _rows];
    }
    
    return urlString;
}

@end
